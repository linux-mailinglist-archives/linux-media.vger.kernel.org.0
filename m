Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5816B747892
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 21:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjGDTLN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 15:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjGDTLM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 15:11:12 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADD010D5;
        Tue,  4 Jul 2023 12:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688497870; x=1720033870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N+jEsHLauGx61KnltWviK6hcwVBEgkMktElW+SHC/C4=;
  b=CBAoVYrSBzLcjIK6rmsU6x2mGdfCJN//bvOyFU+UkCRr5nisHmeK8BmO
   dm+kNZaLPkuije4+YOZ6umn8MFyGTDLbVarPJw/JXhlYVHO4dNyAH2Wv6
   5AQROg2oB0bX2+1ObntNDsAeCLb6fA1lVQJZ4IfL2ZJI2JMocFmi6op6B
   Mgu26sdPATayzYZkHsHHoTU4vsUudXPF6fI+hrv2nnbroTSIUOrhygwKG
   odK28OvvKeSzCjPdxwek3THDFJ9iwuqhggAbffJVBz99CBWymS6lw1xUC
   blBlVSNTFMGsdNsG2El1+TJsEa8AOotcTMurMudYV/TFKEToN9bizBjmX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="429218477"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="429218477"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 12:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="832249738"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="832249738"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2023 12:11:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qGlQW-000ITj-28;
        Tue, 04 Jul 2023 19:11:04 +0000
Date:   Wed, 5 Jul 2023 03:11:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yongqiang Niu <yongqiang.niu@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        CK Hu <ck.hu@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     oe-kbuild-all@lists.linux.dev,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Yongqiang Niu <yongqiang.niu@mediatek.com>,
        linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [v4, PATCH] drm/mediatek: add dma buffer control for drm plane
 disable
Message-ID: <202307050325.QZv71se7-lkp@intel.com>
References: <20230704090432.5844-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704090432.5844-1-yongqiang.niu@mediatek.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yongqiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.4 next-20230704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yongqiang-Niu/drm-mediatek-add-dma-buffer-control-for-drm-plane-disable/20230704-170623
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230704090432.5844-1-yongqiang.niu%40mediatek.com
patch subject: [v4, PATCH] drm/mediatek: add dma buffer control for drm plane disable
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230705/202307050325.QZv71se7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050325.QZv71se7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050325.QZv71se7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module mediatek-drm uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
