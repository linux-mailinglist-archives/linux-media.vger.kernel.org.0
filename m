Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1999D73129C
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 10:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245307AbjFOIsB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 04:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239191AbjFOIrc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 04:47:32 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B382D2130
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 01:46:28 -0700 (PDT)
Received: from [IPV6:2a01:e0a:120:3210:2eb6:cf92:ceb:2dc6] (unknown [IPv6:2a01:e0a:120:3210:2eb6:cf92:ceb:2dc6])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 04B756606ECA;
        Thu, 15 Jun 2023 09:46:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686818787;
        bh=I4Nr1ycBpqRMRtcKx7WWdTDrHQhk2OLoUabpUkTSyHY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=djKwGUzZnbd344cF4y2Y/eH+/rekbSZzctrGCdtcsjkSIZp/zYh83joTBGZMDKrRk
         x5DrWsNpb8wIvqCLH1qLJy8VLK7Esy0yf/6wxACo7YUVgroYewbo2+uW59PdBiTrQw
         bnCsJrRxp3/znqVTsvKHKWQD/SfQ0lDrrAsob1U9qGcPgxYr7jie1NW7Vl5mdlk/lh
         WpGf4iQEClXoJ/13ZkBBkmH8hCvVJlP+FOrgeudyXMh/24DIVNSn3281hmiinmQMZE
         9ijiRYFhcFFzfIwDpcWrSWJr8gA8yz5P8yjRWZ5gMCOBuF5XS37OG2a9fzCwM4i9OP
         6dC+BoGrbicTQ==
Message-ID: <8bd6a1d8-a464-dc43-9ea3-a32c7f490bc1@collabora.com>
Date:   Thu, 15 Jun 2023 10:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [linux-next:master 7549/10326]
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1022:1:
 warning: the frame size of 1112 bytes is larger than 1024 bytes
To:     kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, arnd@arndb.de
References: <202306151506.goHEegOd-lkp@intel.com>
Content-Language: en-US
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <202306151506.goHEegOd-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 15/06/2023 à 09:35, kernel test robot a écrit :
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
> commit: 727a400686a2c0d25015c9e44916a59b72882f83 [7549/10326] media: verisilicon: Add Rockchip AV1 decoder
> config: arm-randconfig-r046-20230615 (https://download.01.org/0day-ci/archive/20230615/202306151506.goHEegOd-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
> reproduce (this is a W=1 build):
>          mkdir -p ~/bin
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=727a400686a2c0d25015c9e44916a59b72882f83
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout 727a400686a2c0d25015c9e44916a59b72882f83
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/platform/verisilicon/
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306151506.goHEegOd-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_segmentation':
>>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1022:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>      1022 | }
>           | ^

Arnd have alreaday send a patch to solve this gcc issue:
https://lore.kernel.org/lkml/20230601151832.3632525-1-arnd@kernel.org/

Regards,
Benjamin

>
>
> vim +1022 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>
>     776	
>     777	static void rockchip_vpu981_av1_dec_set_segmentation(struct hantro_ctx *ctx)
>     778	{
>     779		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
>     780		struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
>     781		const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
>     782		const struct v4l2_av1_segmentation *seg = &frame->segmentation;
>     783		u32 segval[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX] = { 0 };
>     784		struct hantro_dev *vpu = ctx->dev;
>     785		u8 segsign = 0, preskip_segid = 0, last_active_seg = 0, i, j;
>     786	
>     787		if (!!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) &&
>     788		    frame->primary_ref_frame < V4L2_AV1_REFS_PER_FRAME) {
>     789			int idx = rockchip_vpu981_get_frame_index(ctx, frame->primary_ref_frame);
>     790	
>     791			if (idx >= 0) {
>     792				dma_addr_t luma_addr, mv_addr = 0;
>     793				struct hantro_decoded_buffer *seg;
>     794				size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
>     795	
>     796				seg = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
>     797				luma_addr = hantro_get_dec_buf_addr(ctx, &seg->base.vb.vb2_buf);
>     798				mv_addr = luma_addr + mv_offset;
>     799	
>     800				hantro_write_addr(vpu, AV1_SEGMENTATION, mv_addr);
>     801				hantro_reg_write(vpu, &av1_use_temporal3_mvs, 1);
>     802			}
>     803		}
>     804	
>     805		hantro_reg_write(vpu, &av1_segment_temp_upd_e,
>     806				 !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE));
>     807		hantro_reg_write(vpu, &av1_segment_upd_e,
>     808				 !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP));
>     809		hantro_reg_write(vpu, &av1_segment_e,
>     810				 !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED));
>     811	
>     812		hantro_reg_write(vpu, &av1_error_resilient,
>     813				 !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE));
>     814	
>     815		if (IS_INTRA(frame->frame_type) ||
>     816		    !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE)) {
>     817			hantro_reg_write(vpu, &av1_use_temporal3_mvs, 0);
>     818		}
>     819	
>     820		if (seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) {
>     821			int s;
>     822	
>     823			for (s = 0; s < V4L2_AV1_MAX_SEGMENTS; s++) {
>     824				if (seg->feature_enabled[s] &
>     825				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_Q)) {
>     826					segval[s][V4L2_AV1_SEG_LVL_ALT_Q] =
>     827					    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_Q]),
>     828						  0, 255);
>     829					segsign |=
>     830						(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_Q] < 0) << s;
>     831				}
>     832	
>     833				if (seg->feature_enabled[s] &
>     834				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_Y_V))
>     835					segval[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_V] =
>     836						clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]),
>     837						      -63, 63);
>     838	
>     839				if (seg->feature_enabled[s] &
>     840				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_Y_H))
>     841					segval[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_H] =
>     842					    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]),
>     843						  -63, 63);
>     844	
>     845				if (seg->feature_enabled[s] &
>     846				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_U))
>     847					segval[s][V4L2_AV1_SEG_LVL_ALT_LF_U] =
>     848					    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_U]),
>     849						  -63, 63);
>     850	
>     851				if (seg->feature_enabled[s] &
>     852				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_V))
>     853					segval[s][V4L2_AV1_SEG_LVL_ALT_LF_V] =
>     854					    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_V]),
>     855						  -63, 63);
>     856	
>     857				if (frame->frame_type && seg->feature_enabled[s] &
>     858				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_REF_FRAME))
>     859					segval[s][V4L2_AV1_SEG_LVL_REF_FRAME]++;
>     860	
>     861				if (seg->feature_enabled[s] &
>     862				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_REF_SKIP))
>     863					segval[s][V4L2_AV1_SEG_LVL_REF_SKIP] = 1;
>     864	
>     865				if (seg->feature_enabled[s] &
>     866				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_REF_GLOBALMV))
>     867					segval[s][V4L2_AV1_SEG_LVL_REF_GLOBALMV] = 1;
>     868			}
>     869		}
>     870	
>     871		for (i = 0; i < V4L2_AV1_MAX_SEGMENTS; i++) {
>     872			for (j = 0; j < V4L2_AV1_SEG_LVL_MAX; j++) {
>     873				if (seg->feature_enabled[i]
>     874				    & V4L2_AV1_SEGMENT_FEATURE_ENABLED(j)) {
>     875					preskip_segid |= (j >= V4L2_AV1_SEG_LVL_REF_FRAME);
>     876					last_active_seg = max(i, last_active_seg);
>     877				}
>     878			}
>     879		}
>     880	
>     881		hantro_reg_write(vpu, &av1_last_active_seg, last_active_seg);
>     882		hantro_reg_write(vpu, &av1_preskip_segid, preskip_segid);
>     883	
>     884		hantro_reg_write(vpu, &av1_seg_quant_sign, segsign);
>     885	
>     886		/* Write QP, filter level, ref frame and skip for every segment */
>     887		hantro_reg_write(vpu, &av1_quant_seg0,
>     888				 segval[0][V4L2_AV1_SEG_LVL_ALT_Q]);
>     889		hantro_reg_write(vpu, &av1_filt_level_delta0_seg0,
>     890				 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
>     891		hantro_reg_write(vpu, &av1_filt_level_delta1_seg0,
>     892				 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
>     893		hantro_reg_write(vpu, &av1_filt_level_delta2_seg0,
>     894				 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_U]);
>     895		hantro_reg_write(vpu, &av1_filt_level_delta3_seg0,
>     896				 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_V]);
>     897		hantro_reg_write(vpu, &av1_refpic_seg0,
>     898				 segval[0][V4L2_AV1_SEG_LVL_REF_FRAME]);
>     899		hantro_reg_write(vpu, &av1_skip_seg0,
>     900				 segval[0][V4L2_AV1_SEG_LVL_REF_SKIP]);
>     901		hantro_reg_write(vpu, &av1_global_mv_seg0,
>     902				 segval[0][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
>     903	
>     904		hantro_reg_write(vpu, &av1_quant_seg1,
>     905				 segval[1][V4L2_AV1_SEG_LVL_ALT_Q]);
>     906		hantro_reg_write(vpu, &av1_filt_level_delta0_seg1,
>     907				 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
>     908		hantro_reg_write(vpu, &av1_filt_level_delta1_seg1,
>     909				 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
>     910		hantro_reg_write(vpu, &av1_filt_level_delta2_seg1,
>     911				 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_U]);
>     912		hantro_reg_write(vpu, &av1_filt_level_delta3_seg1,
>     913				 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_V]);
>     914		hantro_reg_write(vpu, &av1_refpic_seg1,
>     915				 segval[1][V4L2_AV1_SEG_LVL_REF_FRAME]);
>     916		hantro_reg_write(vpu, &av1_skip_seg1,
>     917				 segval[1][V4L2_AV1_SEG_LVL_REF_SKIP]);
>     918		hantro_reg_write(vpu, &av1_global_mv_seg1,
>     919				 segval[1][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
>     920	
>     921		hantro_reg_write(vpu, &av1_quant_seg2,
>     922				 segval[2][V4L2_AV1_SEG_LVL_ALT_Q]);
>     923		hantro_reg_write(vpu, &av1_filt_level_delta0_seg2,
>     924				 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
>     925		hantro_reg_write(vpu, &av1_filt_level_delta1_seg2,
>     926				 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
>     927		hantro_reg_write(vpu, &av1_filt_level_delta2_seg2,
>     928				 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_U]);
>     929		hantro_reg_write(vpu, &av1_filt_level_delta3_seg2,
>     930				 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_V]);
>     931		hantro_reg_write(vpu, &av1_refpic_seg2,
>     932				 segval[2][V4L2_AV1_SEG_LVL_REF_FRAME]);
>     933		hantro_reg_write(vpu, &av1_skip_seg2,
>     934				 segval[2][V4L2_AV1_SEG_LVL_REF_SKIP]);
>     935		hantro_reg_write(vpu, &av1_global_mv_seg2,
>     936				 segval[2][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
>     937	
>     938		hantro_reg_write(vpu, &av1_quant_seg3,
>     939				 segval[3][V4L2_AV1_SEG_LVL_ALT_Q]);
>     940		hantro_reg_write(vpu, &av1_filt_level_delta0_seg3,
>     941				 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
>     942		hantro_reg_write(vpu, &av1_filt_level_delta1_seg3,
>     943				 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
>     944		hantro_reg_write(vpu, &av1_filt_level_delta2_seg3,
>     945				 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_U]);
>     946		hantro_reg_write(vpu, &av1_filt_level_delta3_seg3,
>     947				 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_V]);
>     948		hantro_reg_write(vpu, &av1_refpic_seg3,
>     949				 segval[3][V4L2_AV1_SEG_LVL_REF_FRAME]);
>     950		hantro_reg_write(vpu, &av1_skip_seg3,
>     951				 segval[3][V4L2_AV1_SEG_LVL_REF_SKIP]);
>     952		hantro_reg_write(vpu, &av1_global_mv_seg3,
>     953				 segval[3][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
>     954	
>     955		hantro_reg_write(vpu, &av1_quant_seg4,
>     956				 segval[4][V4L2_AV1_SEG_LVL_ALT_Q]);
>     957		hantro_reg_write(vpu, &av1_filt_level_delta0_seg4,
>     958				 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
>     959		hantro_reg_write(vpu, &av1_filt_level_delta1_seg4,
>     960				 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
>     961		hantro_reg_write(vpu, &av1_filt_level_delta2_seg4,
>     962				 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_U]);
>     963		hantro_reg_write(vpu, &av1_filt_level_delta3_seg4,
>     964				 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_V]);
>     965		hantro_reg_write(vpu, &av1_refpic_seg4,
>     966				 segval[4][V4L2_AV1_SEG_LVL_REF_FRAME]);
>     967		hantro_reg_write(vpu, &av1_skip_seg4,
>     968				 segval[4][V4L2_AV1_SEG_LVL_REF_SKIP]);
>     969		hantro_reg_write(vpu, &av1_global_mv_seg4,
>     970				 segval[4][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
>     971	
>     972		hantro_reg_write(vpu, &av1_quant_seg5,
>     973				 segval[5][V4L2_AV1_SEG_LVL_ALT_Q]);
>     974		hantro_reg_write(vpu, &av1_filt_level_delta0_seg5,
>     975				 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
>     976		hantro_reg_write(vpu, &av1_filt_level_delta1_seg5,
>     977				 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
>     978		hantro_reg_write(vpu, &av1_filt_level_delta2_seg5,
>     979				 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_U]);
>     980		hantro_reg_write(vpu, &av1_filt_level_delta3_seg5,
>     981				 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_V]);
>     982		hantro_reg_write(vpu, &av1_refpic_seg5,
>     983				 segval[5][V4L2_AV1_SEG_LVL_REF_FRAME]);
>     984		hantro_reg_write(vpu, &av1_skip_seg5,
>     985				 segval[5][V4L2_AV1_SEG_LVL_REF_SKIP]);
>     986		hantro_reg_write(vpu, &av1_global_mv_seg5,
>     987				 segval[5][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
>     988	
>     989		hantro_reg_write(vpu, &av1_quant_seg6,
>     990				 segval[6][V4L2_AV1_SEG_LVL_ALT_Q]);
>     991		hantro_reg_write(vpu, &av1_filt_level_delta0_seg6,
>     992				 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
>     993		hantro_reg_write(vpu, &av1_filt_level_delta1_seg6,
>     994				 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
>     995		hantro_reg_write(vpu, &av1_filt_level_delta2_seg6,
>     996				 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_U]);
>     997		hantro_reg_write(vpu, &av1_filt_level_delta3_seg6,
>     998				 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_V]);
>     999		hantro_reg_write(vpu, &av1_refpic_seg6,
>    1000				 segval[6][V4L2_AV1_SEG_LVL_REF_FRAME]);
>    1001		hantro_reg_write(vpu, &av1_skip_seg6,
>    1002				 segval[6][V4L2_AV1_SEG_LVL_REF_SKIP]);
>    1003		hantro_reg_write(vpu, &av1_global_mv_seg6,
>    1004				 segval[6][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
>    1005	
>    1006		hantro_reg_write(vpu, &av1_quant_seg7,
>    1007				 segval[7][V4L2_AV1_SEG_LVL_ALT_Q]);
>    1008		hantro_reg_write(vpu, &av1_filt_level_delta0_seg7,
>    1009				 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
>    1010		hantro_reg_write(vpu, &av1_filt_level_delta1_seg7,
>    1011				 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
>    1012		hantro_reg_write(vpu, &av1_filt_level_delta2_seg7,
>    1013				 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_U]);
>    1014		hantro_reg_write(vpu, &av1_filt_level_delta3_seg7,
>    1015				 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_V]);
>    1016		hantro_reg_write(vpu, &av1_refpic_seg7,
>    1017				 segval[7][V4L2_AV1_SEG_LVL_REF_FRAME]);
>    1018		hantro_reg_write(vpu, &av1_skip_seg7,
>    1019				 segval[7][V4L2_AV1_SEG_LVL_REF_SKIP]);
>    1020		hantro_reg_write(vpu, &av1_global_mv_seg7,
>    1021				 segval[7][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
>> 1022	}
>    1023	
>
