Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 185B9BC5FB
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 12:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405618AbfIXK40 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 06:56:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:45875 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388652AbfIXK4Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 06:56:25 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 03:56:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208";a="388818463"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Sep 2019 03:56:20 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iCiUW-000FWz-Ej; Tue, 24 Sep 2019 18:56:20 +0800
Date:   Tue, 24 Sep 2019 18:56:08 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     kbuild-all@01.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
        Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v3 5/5] media: platform: Add jpeg dec/enc feature
Message-ID: <201909241844.UH843Yx0%lkp@intel.com>
References: <20190924074303.22713-6-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924074303.22713-6-xia.jiang@mediatek.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[cannot apply to v5.3 next-20190920]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Xia-Jiang/Add-support-for-mt2701-JPEG-ENC-support/20190924-161234
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   include/linux/sched.h:609:43: sparse: sparse: bad integer constant expression
   include/linux/sched.h:609:73: sparse: sparse: invalid named zero-width bitfield `value'
   include/linux/sched.h:610:43: sparse: sparse: bad integer constant expression
   include/linux/sched.h:610:67: sparse: sparse: invalid named zero-width bitfield `bucket_id'
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse: sparse: incompatible types in comparison expression (different signedness):
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse:    unsigned int *
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse:    int *
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse: sparse: cast from unknown type
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse: sparse: incompatible types in comparison expression (different signedness):
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse:    unsigned int *
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse:    int *
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse: sparse: incompatible types in comparison expression (different signedness):
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse:    unsigned int *
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse:    int *
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse: sparse: cast from unknown type
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse: sparse: incompatible types in comparison expression (different signedness):
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse:    unsigned int *
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse:    int *
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse: sparse: cast from unknown type
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse: sparse: incompatible types in comparison expression (different signedness):
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse:    unsigned int *
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse:    int *
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:338:42: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:341:41: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:417:34: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse: sparse: cast from unknown type
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse:    unsigned int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse:    int *
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:419:33: sparse: sparse: cast from unknown type

vim +338 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c

   316	
   317	static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
   318					   struct mtk_jpeg_fmt *fmt,
   319					   struct mtk_jpeg_ctx *ctx, int q_type)
   320	{
   321		struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
   322		struct mtk_jpeg_dev *jpeg = ctx->jpeg;
   323		int i, align_w, align_h;
   324	
   325		memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
   326		pix_mp->field = V4L2_FIELD_NONE;
   327	
   328		if (ctx->state != MTK_JPEG_INIT) {
   329			mtk_jpeg_adjust_fmt_mplane(ctx, f);
   330			goto end;
   331		}
   332	
   333		pix_mp->num_planes = fmt->colplanes;
   334		pix_mp->pixelformat = fmt->fourcc;
   335	
   336		if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {
   337			if (jpeg->mode == MTK_JPEG_ENC) {
 > 338				pix_mp->height = clamp(pix_mp->height,
   339						       MTK_JPEG_MIN_HEIGHT,
   340						       MTK_JPEG_MAX_HEIGHT);
   341				pix_mp->width = clamp(pix_mp->width,
   342						      MTK_JPEG_MIN_WIDTH,
   343						      MTK_JPEG_MAX_WIDTH);
   344				align_w = pix_mp->width;
   345				align_h = pix_mp->height;
   346				align_w = round_up(align_w, 2);
   347				if (pix_mp->num_planes == 1U) {
   348					align_w = align_w << 1;
   349					mtk_jpeg_bound_align_image(&align_w,
   350								   MTK_JPEG_MIN_WIDTH,
   351								   MTK_JPEG_MAX_WIDTH,
   352								   5, &align_h,
   353								   MTK_JPEG_MIN_HEIGHT,
   354								   MTK_JPEG_MAX_HEIGHT,
   355								   3);
   356					pix_mp->plane_fmt[0].bytesperline = align_w;
   357					pix_mp->plane_fmt[0].sizeimage =
   358						align_w * align_h;
   359				} else if (pix_mp->num_planes == 2U) {
   360					mtk_jpeg_bound_align_image(&align_w,
   361								   MTK_JPEG_MIN_WIDTH,
   362								   MTK_JPEG_MAX_WIDTH,
   363								   4, &align_h,
   364								   MTK_JPEG_MIN_HEIGHT,
   365								   MTK_JPEG_MAX_HEIGHT,
   366								   4);
   367					pix_mp->plane_fmt[0].bytesperline = align_w;
   368					pix_mp->plane_fmt[0].sizeimage =
   369						align_w * align_h;
   370					pix_mp->plane_fmt[1].bytesperline = align_w;
   371					pix_mp->plane_fmt[1].sizeimage =
   372						(align_w * align_h) / 2;
   373				} else {
   374					v4l2_err(&ctx->jpeg->v4l2_dev,
   375						 "Unsupport num planes = %d\n",
   376						 pix_mp->num_planes);
   377				}
   378				goto end;
   379			} else {
   380				struct v4l2_plane_pix_format *pfmt =
   381							&pix_mp->plane_fmt[0];
   382	
   383				mtk_jpeg_bound_align_image(&pix_mp->width,
   384							   MTK_JPEG_MIN_WIDTH,
   385						   MTK_JPEG_MAX_WIDTH, 0,
   386							   &pix_mp->height,
   387							   MTK_JPEG_MIN_HEIGHT,
   388						   MTK_JPEG_MAX_HEIGHT, 0);
   389	
   390				pfmt->bytesperline = 0;
   391				/* Source size must be aligned to 128 */
   392				pfmt->sizeimage = mtk_jpeg_align(pfmt->sizeimage, 128);
   393				if (pfmt->sizeimage == 0)
   394					pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
   395	
   396				goto end;
   397			}
   398		}
   399	
   400		/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
   401		if (jpeg->mode == MTK_JPEG_ENC) {
   402			mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
   403						   MTK_JPEG_MAX_WIDTH, 0,
   404						   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
   405						   MTK_JPEG_MAX_HEIGHT, 0);
   406	
   407			if (fmt->fourcc == V4L2_PIX_FMT_JPEG) {
   408				pix_mp->plane_fmt[0].bytesperline = 0;
   409				pix_mp->plane_fmt[0].sizeimage =
   410					mtk_jpeg_align(pix_mp->plane_fmt[0].sizeimage,
   411						       128);
   412				if (pix_mp->plane_fmt[0].sizeimage == 0)
   413					pix_mp->plane_fmt[0].sizeimage =
   414						MTK_JPEG_DEFAULT_SIZEIMAGE;
   415			}
   416		} else {
   417			pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
   418					       MTK_JPEG_MAX_HEIGHT);
   419			pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
   420					      MTK_JPEG_MAX_WIDTH);
   421			mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
   422						   MTK_JPEG_MAX_WIDTH, fmt->h_align,
   423						   &pix_mp->height,
   424						   MTK_JPEG_MIN_HEIGHT,
   425						   MTK_JPEG_MAX_HEIGHT, fmt->v_align);
   426	
   427			for (i = 0; i < fmt->colplanes; i++) {
   428				struct v4l2_plane_pix_format *pfmt =
   429						&pix_mp->plane_fmt[i];
   430				u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
   431				u32 h = pix_mp->height * fmt->v_sample[i] / 4;
   432	
   433				pfmt->bytesperline = stride;
   434				pfmt->sizeimage = stride * h;
   435			}
   436		}
   437	
   438		for (i = 0; i < fmt->colplanes; i++) {
   439			struct v4l2_plane_pix_format *pfmt =
   440					&pix_mp->plane_fmt[i];
   441			memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
   442		}
   443	end:
   444		v4l2_dbg(2, debug, &jpeg->v4l2_dev, "wxh:%ux%u\n",
   445			 pix_mp->width, pix_mp->height);
   446		for (i = 0; i < pix_mp->num_planes; i++) {
   447			v4l2_dbg(2, debug, &jpeg->v4l2_dev,
   448				 "plane[%d] bpl=%u, size=%u\n",
   449				 i,
   450				 pix_mp->plane_fmt[i].bytesperline,
   451				 pix_mp->plane_fmt[i].sizeimage);
   452		}
   453		return 0;
   454	}
   455	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
