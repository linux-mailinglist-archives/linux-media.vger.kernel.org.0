Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079931A64B8
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 11:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgDMJei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 05:34:38 -0400
Received: from mga03.intel.com ([134.134.136.65]:43265 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728050AbgDMJeh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 05:34:37 -0400
IronPort-SDR: BdTNnY34wRw48Zn3p80KWS9Rdmj20UfankRH2NW6xlWGK1eeqokplZsJ7w9axP82F8wYDtTDcm
 1v/Mw86PUcCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 02:34:36 -0700
IronPort-SDR: /CZzQ9NntPxfhQZZb9mFLal/uSUqW3loJd1graIFfe5qVa+8MQjYvuIQHgE1kIgeWbQImMbyH5
 ar/7HYJRXzaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="276850248"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2020 02:34:34 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jNvUA-0006kv-0i; Mon, 13 Apr 2020 17:34:34 +0800
Date:   Mon, 13 Apr 2020 17:34:06 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/2] media: staging/imx: Don't assume OF port id equals
 pad index
Message-ID: <202004131756.PwC6hvk8%lkp@intel.com>
References: <20200413011416.2355-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413011416.2355-2-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.7-rc1 next-20200413]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Laurent-Pinchart/media-imx6-Support-complex-external-topologies/20200413-091602
base:   git://linuxtv.org/media_tree.git master

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/staging/media/imx/imx-media-of.c:169:6: warning: The scope of the variable 'ret' can be reduced. [variableScope]
    int ret;
        ^
>> drivers/staging/media/imx/imx-media-of.c:110:5: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
       ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
       ^
   drivers/staging/media/imx/imx-media-of.c:130:38: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
        pad_flags & MEDIA_PAD_FL_SOURCE ?
                                        ^

vim +110 drivers/staging/media/imx/imx-media-of.c

    77	
    78	/*
    79	 * Create a single media link to/from sd using a fwnode link.
    80	 *
    81	 * NOTE: this function assumes that an OF endpoint node is equivalent to a
    82	 * media link.
    83	 */
    84	static int create_of_link(struct imx_media_dev *imxmd,
    85				  struct v4l2_subdev *sd,
    86				  struct v4l2_fwnode_link *link)
    87	{
    88		struct v4l2_subdev *remote, *src, *sink;
    89		int src_pad, sink_pad;
    90		int remote_pad;
    91		u32 pad_flags;
    92	
    93		if (link->local_port >= sd->entity.num_pads)
    94			return -EINVAL;
    95	
    96		remote = imx_media_find_subdev_by_fwnode(imxmd, link->remote_node);
    97		if (!remote)
    98			return 0;
    99	
   100		/*
   101		 * Find the remote pad. Try the pad corresponding to the fwnode port id
   102		 * first. If its direction doesn't correspond to what we expect, use the
   103		 * first pad that has the right direction.
   104		 *
   105		 * FIXME: Media entities should provide an operation to translate from
   106		 * fwnode port id to pad index.
   107		 */
   108		pad_flags = sd->entity.pads[link->local_port].flags;
   109		pad_flags = pad_flags & MEDIA_PAD_FL_SINK
 > 110			  ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
   111	
   112		if (link->remote_port < remote->entity.num_pads &&
   113		    remote->entity.pads[link->remote_port].flags & pad_flags) {
   114			remote_pad = link->remote_port;
   115		} else {
   116			unsigned int i;
   117	
   118			remote_pad = -1;
   119			for (i = 0; i < remote->entity.num_pads; ++i) {
   120				if (remote->entity.pads[i].flags & pad_flags) {
   121					remote_pad = i;
   122					break;
   123				}
   124			}
   125	
   126			if (remote_pad == -1) {
   127				v4l2_err(sd->v4l2_dev,
   128					 "remote entity %s has no %s pad\n",
   129					 remote->name,
   130					 pad_flags & MEDIA_PAD_FL_SOURCE ?
   131					 "source" : "sink");
   132				return -EINVAL;
   133			}
   134		}
   135	
   136		/* Mad the local and remote entities to source and sink. */
   137		if (pad_flags & MEDIA_PAD_FL_SOURCE) {
   138			src = remote;
   139			src_pad = remote_pad;
   140			sink = sd;
   141			sink_pad = link->local_port;
   142		} else {
   143			src = sd;
   144			src_pad = link->local_port;
   145			sink = remote;
   146			sink_pad = remote_pad;
   147		}
   148	
   149		/* Make sure link doesn't already exist before creating it. */
   150		if (media_entity_find_link(&src->entity.pads[src_pad],
   151					   &sink->entity.pads[sink_pad]))
   152			return 0;
   153	
   154		v4l2_info(sd->v4l2_dev, "%s:%d -> %s:%d\n",
   155			  src->name, src_pad, sink->name, sink_pad);
   156	
   157		return media_create_pad_link(&src->entity, src_pad,
   158					     &sink->entity, sink_pad, 0);
   159	}
   160	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
