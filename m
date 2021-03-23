Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF62334594F
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhCWIJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:09:30 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:44559 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229771AbhCWIJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:09:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Oc60luX47UzyrOc63lOfIe; Tue, 23 Mar 2021 09:09:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616486944; bh=MKou+qO3aBvNGHg5E4Um3/CxqFQnqwp8ZYWBLZEwTQU=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=muO3ye0TBLQPkItLDdlJiFiNn1/vPvH0EQFIwn8boGdoMeaMFVgIBOSmLmqTAQY46
         f505J1KbAKd9rIRfxF+uwu4pFwwlbHswCqf2oP+FTEX56VAaqntJozLhGKVqJjD4hS
         425aYnDTBTOiYg60PQU4+S9rVtq6NEOB2TIopIXyb5P70PD6HQ9MgzUROn9Y/vESn4
         bsS2xmO/18tkDHMgSdM38pa5ZsmpQ2WAUfJbcJn4cSA3QhTtvrocJ2mVJyXWM8fXxo
         YiUURUQdh8qowtlrsvArw684vKfP2Y/aThyMXYI6tnjnCX/tTg6Hulcyix0VSCqXh8
         0uep0rF7uIxmA==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Can you fix these mtk-vcodec kernel-doc warnings?
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <aff759b7-d65e-b47e-006e-319e54dbda1c@xs4all.nl>
Date:   Tue, 23 Mar 2021 09:09:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBgskZjx1dVSDW6h+88CMZB99QFPEvt9QNtRn++WRveQJgKC2dZ069xjk9JculQvk/D+dEOI0IqRygH0vNHycbUqDWgcCV0zJdk9dJFCavUoCf+0lOnI
 x6xOMRhMo/RzURZsEEEfMlu/Jsh7XkLfTw2DpeMO+P90dIzHlortBorqAe0JxHi+F1ai10EaAA12phofqtQlvR1dXsAmrkcJ+350QXgSO2EaXyHjkEswZfkO
 l9vi3GxRGPGw6efOpydaIdON7DZagp8xJwzJpG8I/LIauUPH+DT0dNIe8vQOXX4wijCDCD1c72gxH0ETEas9iR0fzZ3oWSYsf0aFgQGQaHnnEDg/EM09vITs
 G79VuYp+
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I've been cleaning up kernel-doc warnings in driver headers. Any issues are now
reported by the daily build, but there are way too many, so this needs to be
fixed.

Can someone take a look at the following mtk-vcodec warnings?

drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'AP_IPIMSG_ENC_INIT' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'AP_IPIMSG_ENC_SET_PARAM' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'AP_IPIMSG_ENC_ENCODE' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'AP_IPIMSG_ENC_DEINIT' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'VPU_IPIMSG_ENC_INIT_DONE' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'VPU_IPIMSG_ENC_SET_PARAM_DONE' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'VPU_IPIMSG_ENC_ENCODE_DONE' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'VPU_IPIMSG_ENC_DEINIT_DONE' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Excess enum value 'AP_IPIMSG_ENC_XXX' description in 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Excess enum value 'VPU_IPIMSG_ENC_XXX_DONE' description in 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:120: warning: Enum value 'VENC_IPI_MSG_STATUS_OK' not described in enum 'venc_ipi_msg_status'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:120: warning: Enum value 'VENC_IPI_MSG_STATUS_FAIL' not described in enum 'venc_ipi_msg_status'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_SYS' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_MISC' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_LD' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_TOP' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_CM' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_AD' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_AV' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_PP' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_HWD' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_HWQ' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_HWB' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_HWG' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'NUM_MAX_VDEC_REG_BASE' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VENC_SYS' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VENC_LT_SYS' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'NUM_MAX_VCODEC_REG_BASE' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:58: warning: Enum value 'MTK_INST_DECODER' not described in enum 'mtk_instance_type'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:58: warning: Enum value 'MTK_INST_ENCODER' not described in enum 'mtk_instance_type'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_NONE' not described in enum 'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_BITRATE' not described in enum 'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_FRAMERATE' not described in enum 'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_INTRA_PERIOD' not described in enum
'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_FORCE_INTRA' not described in enum
'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_GOP_SIZE' not described in enum 'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:103: warning: Function parameter or member 'fourcc' not described in 'mtk_video_fmt'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:103: warning: Function parameter or member 'type' not described in 'mtk_video_fmt'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:103: warning: Function parameter or member 'num_planes' not described in 'mtk_video_fmt'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:103: warning: Function parameter or member 'flags' not described in 'mtk_video_fmt'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:112: warning: Function parameter or member 'fourcc' not described in 'mtk_codec_framesizes'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:112: warning: Function parameter or member 'stepwise' not described in 'mtk_codec_framesizes'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:120: warning: Enum value 'MTK_Q_DATA_SRC' not described in enum 'mtk_q_type'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:120: warning: Enum value 'MTK_Q_DATA_DST' not described in enum 'mtk_q_type'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'visible_width' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'visible_height' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'coded_width' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'coded_height' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'field' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'bytesperline' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'sizeimage' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'fmt' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:177: warning: Function parameter or member 'clk_name' not described in 'mtk_vcodec_clk_info'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:177: warning: Function parameter or member 'vcodec_clk' not described in
'mtk_vcodec_clk_info'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:185: warning: Function parameter or member 'clk_info' not described in 'mtk_vcodec_clk'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:185: warning: Function parameter or member 'clk_num' not described in 'mtk_vcodec_clk'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:199: warning: Function parameter or member 'vdec_clk' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:199: warning: Function parameter or member 'larbvdec' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:199: warning: Function parameter or member 'venc_clk' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:199: warning: Function parameter or member 'larbvenc' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:199: warning: Function parameter or member 'larbvenclt' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:199: warning: Function parameter or member 'dev' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:199: warning: Function parameter or member 'mtkdev' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:301: warning: Function parameter or member 'decoded_frame_cnt' not described in
'mtk_vcodec_ctx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:333: warning: Function parameter or member 'min_bitrate' not described in
'mtk_vcodec_enc_pdata'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:408: warning: Function parameter or member 'venc_pdata' not described in 'mtk_vcodec_dev'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:408: warning: Function parameter or member 'decode_workqueue' not described in
'mtk_vcodec_dev'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'AP_IPIMSG_DEC_INIT' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'AP_IPIMSG_DEC_START' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'AP_IPIMSG_DEC_END' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'AP_IPIMSG_DEC_DEINIT' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'AP_IPIMSG_DEC_RESET' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'VPU_IPIMSG_DEC_INIT_ACK' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'VPU_IPIMSG_DEC_START_ACK' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'VPU_IPIMSG_DEC_END_ACK' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'VPU_IPIMSG_DEC_DEINIT_ACK' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'VPU_IPIMSG_DEC_RESET_ACK' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Excess enum value 'VPU_IPIMSG_XXX_ACK' description in 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Excess enum value 'AP_IPIMSG_XXX' description in 'vdec_ipi_msgid'

Thanks!

	Hans
