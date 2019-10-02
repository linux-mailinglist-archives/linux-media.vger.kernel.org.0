Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A72C86E0
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 13:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfJBLCQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 07:02:16 -0400
Received: from mga11.intel.com ([192.55.52.93]:16269 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbfJBLCQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 07:02:16 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 04:02:15 -0700
X-IronPort-AV: E=Sophos;i="5.64,574,1559545200"; 
   d="scan'208";a="182014760"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 04:02:10 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0BB2220976; Wed,  2 Oct 2019 14:02:08 +0300 (EEST)
Date:   Wed, 2 Oct 2019 14:02:08 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jungo Lin <jungo.lin@mediatek.com>, tfiga@chromium.org,
        laurent.pinchart+renesas@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        christie.yu@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com,
        seraph.huang@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org
Subject: Re: [RFC,V2,07/11] media: platform: Add Mediatek ISP P1 private
 control
Message-ID: <20191002110207.GD972@paasikivi.fi.intel.com>
References: <jungo.lin@mediatek.com>
 <20190510015755.51495-8-jungo.lin@mediatek.com>
 <49a8ba54-aba4-1915-6732-987a58e8bd3c@xs4all.nl>
 <20191002105559.GC972@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002105559.GC972@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 02, 2019 at 01:55:59PM +0300, Sakari Ailus wrote:
> Hi Jungo, Hans,
> 
> On Mon, May 13, 2019 at 10:46:46AM +0200, Hans Verkuil wrote:
> > On 5/10/19 3:58 AM, Jungo Lin wrote:
> ...
> > > +struct v4l2_ctrl_config mtk_cam_controls[] = {
> > > +	{
> > > +	.ops = &mtk_cam_dev_ctrl_ops,
> > > +	.id = V4L2_CID_PRIVATE_GET_BIN_INFO,
> > 
> > Don't use "PRIVATE" in the name. I'd replace that with MTK to indicate
> > that this is mediatek-specific. Same for the next control below.
> > 
> > > +	.name = "MTK CAM GET BIN INFO",
> > > +	.type = V4L2_CTRL_TYPE_INTEGER,
> > > +	.min = (IMG_MIN_WIDTH << 16) | IMG_MIN_HEIGHT,
> > > +	.max = (IMG_MAX_WIDTH << 16) | IMG_MAX_HEIGHT,
> > > +	.step = 1,
> > > +	.def = (IMG_MAX_WIDTH << 16) | IMG_MAX_HEIGHT,
> > > +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
> > 
> > Don't mix width and height. I recommend splitting this into two controls.
> > 
> > Sakari might have an opinion on this as well.
> > 
> > > +	},
> > > +	{
> > > +	.ops = &mtk_cam_dev_ctrl_ops,
> > > +	.id = V4L2_CID_PRIVATE_RAW_PATH,
> > > +	.name = "MTK CAM RAW PATH",
> > > +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> > > +	.min = 0,
> > > +	.max = 1,
> > > +	.step = 1,
> > > +	.def = 1,
> > > +	},
> > 
> > RAW_PATH is a very vague name. If it is 0, then it is pure raw, and if it
> > is 1, then it is 'processing raw'? If so, call it "Processing Raw".
> 
> Jungo: what's the purpose of 

Please ignore the comment. I'll review a later version separately.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
