Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E796936CD5A
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 22:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239077AbhD0U46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 16:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237072AbhD0U45 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 16:56:57 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9429C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 13:56:13 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id j3so29730436qvs.1
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 13:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3vypzy7fVK4IlHmF+WrpN6jrxjTQ1LVGCPCz1r/WPgE=;
        b=P/hB3ikWlPQ593P2IDLqm6gBV/X0ptvrzN9R6x2gRfb/8G9ST0aNikA5kSuoK4Fruu
         zJP3K2nrI339KfEh1bUmWRykPkv3K9bZT8DrKyJOZk5W+4xSY4Ra1XDkXALKo/r8+2yR
         Kr09aJESiQc8Znwn/ID6SDdoCElKUFXhJlW58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vypzy7fVK4IlHmF+WrpN6jrxjTQ1LVGCPCz1r/WPgE=;
        b=j9DM81HzcHTwDGxrvQMfvRLz+4tYlnLj7/Sj5Iww/V45O36iKhSYzknRzpE25W42it
         DO8De4TsD10jR3uOApIagX16LeZOAkC3tcEOqHaizCEDmDOR4sFKPNAQZtbggp04wo02
         KM0n7NxlLOsZPU2sPzRWYraUnkSw01OJVKhS9bJSirdQFR9paQAnRpUWKkd00GLk3OhI
         PoyA3mvV2M2lATuYl9EWSFzdFhCbRhh1Siqg1PN4EveM87n9x6qYxYOOFTMs8VLouyGb
         cMY9yF2vF7X2OapNCWrEIo3Ccb6ZjZ/wgZ1EbM9CaXCLd65aybDAKavsbGbgY+HAsH0x
         R+oQ==
X-Gm-Message-State: AOAM533tt67J+5eENZJI8hjWLUVqzhz0X6cPvGf5aAc7W1Se4nql/W74
        6a2f6qxl3AYujQ14jlqGckmdj5HMml2RsQ==
X-Google-Smtp-Source: ABdhPJyYrBW8BuwL1qqCX2Xgh2FQZWwFCpTl6MgY7YzbMOM2VUJzQN6d4DSKGikBtlrmwwI3I6NPIQ==
X-Received: by 2002:a05:6214:1bca:: with SMTP id m10mr25381400qvc.56.1619556972583;
        Tue, 27 Apr 2021 13:56:12 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id o12sm3773284qkg.36.2021.04.27.13.56.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 13:56:11 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id p202so27402892ybg.8
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 13:56:11 -0700 (PDT)
X-Received: by 2002:a25:b6c5:: with SMTP id f5mr33864390ybm.407.1619556970580;
 Tue, 27 Apr 2021 13:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <1618210723-2310-1-git-send-email-dikshita@codeaurora.org>
In-Reply-To: <1618210723-2310-1-git-send-email-dikshita@codeaurora.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Tue, 27 Apr 2021 13:55:59 -0700
X-Gmail-Original-Message-ID: <CAMfZQbzh+6VQ-Gw1smyPtP-pud2ZK+sG9vUm5ehedfjpBT_qnQ@mail.gmail.com>
Message-ID: <CAMfZQbzh+6VQ-Gw1smyPtP-pud2ZK+sG9vUm5ehedfjpBT_qnQ@mail.gmail.com>
Subject: Re: [PATCH] media: venus: Enable low power setting for encoder
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 11, 2021 at 11:59 PM Dikshita Agarwal
<dikshita@codeaurora.org> wrote:
>
> Set the FW to run in low power for encoder
> to accommodate more session without losing much on quality.
>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.h           |   6 ++
>  drivers/media/platform/qcom/venus/helpers.c        |   2 +
>  drivers/media/platform/qcom/venus/hfi_helper.h     |  10 +-
>  drivers/media/platform/qcom/venus/hfi_platform.c   |  16 +++
>  drivers/media/platform/qcom/venus/hfi_platform.h   |   4 +
>  .../media/platform/qcom/venus/hfi_platform_v4.c    |  28 ++++--
>  .../media/platform/qcom/venus/hfi_platform_v6.c    |  28 ++++--
>  drivers/media/platform/qcom/venus/pm_helpers.c     | 108 ++++++++++++++++++---
>  8 files changed, 167 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 9451e54..9b5031f 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -257,6 +257,7 @@ struct clock_data {
>         unsigned long freq;
>         unsigned long vpp_freq;
>         unsigned long vsp_freq;
> +       unsigned long low_power_freq;
>  };
>
>  #define to_venus_buffer(ptr)   container_of(ptr, struct venus_buffer, vb)
> @@ -280,6 +281,10 @@ struct venus_ts_metadata {
>         struct v4l2_timecode tc;
>  };
>
> +enum venus_inst_modes {
> +       VENUS_LOW_POWER = BIT(0),
> +};
> +
>  /**
>   * struct venus_inst - holds per instance parameters
>   *
> @@ -400,6 +405,7 @@ struct venus_inst {
>         unsigned int pic_struct;
>         bool next_buf_last;
>         bool drain_active;
> +       enum venus_inst_modes flags;
>  };
>
>  #define IS_V1(core)    ((core)->res->hfi_version == HFI_VERSION_1XX)
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 76ece2f..c6b6a30 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -1566,6 +1566,8 @@ int venus_helper_session_init(struct venus_inst *inst)
>                                                                   session_type);
>         inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version, codec,
>                                                                   session_type);
> +       inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version, codec,
> +                                                                      session_type);
>
>         return 0;
>  }
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 6b524c7..5621cdb 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -412,9 +412,6 @@
>  #define HFI_BUFFER_MODE_RING                   0x1000002
>  #define HFI_BUFFER_MODE_DYNAMIC                        0x1000003
>
> -#define HFI_VENC_PERFMODE_MAX_QUALITY          0x1
> -#define HFI_VENC_PERFMODE_POWER_SAVE           0x2
> -
>  /*
>   * HFI_PROPERTY_SYS_COMMON_START
>   * HFI_DOMAIN_BASE_COMMON + HFI_ARCH_COMMON_OFFSET + 0x0000
> @@ -815,6 +812,13 @@ struct hfi_framesize {
>         u32 height;
>  };
>
> +#define HFI_VENC_PERFMODE_MAX_QUALITY          0x1
> +#define HFI_VENC_PERFMODE_POWER_SAVE           0x2
> +
> +struct hfi_perf_mode {
> +       u32 video_perf_mode;
> +};
> +
>  #define VIDC_CORE_ID_DEFAULT   0
>  #define VIDC_CORE_ID_1         1
>  #define VIDC_CORE_ID_2         2
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> index 8f47804..f5b4e1f 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> @@ -50,6 +50,22 @@ hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session
>         return freq;
>  }
>
> +unsigned long
> +hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_type)
> +{
> +       const struct hfi_platform *plat;
> +       unsigned long freq = 0;
> +
> +       plat = hfi_platform_get(version);
> +       if (!plat)
> +               return 0;
> +
> +       if (plat->codec_lp_freq)
> +               freq = plat->codec_lp_freq(session_type, codec);
> +
> +       return freq;
> +}
> +
>  u8 hfi_platform_num_vpp_pipes(enum hfi_version version)
>  {
>         const struct hfi_platform *plat;
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> index 3819bb2..2dbe608 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> @@ -43,11 +43,13 @@ struct hfi_platform_codec_freq_data {
>         u32 session_type;
>         unsigned long vpp_freq;
>         unsigned long vsp_freq;
> +       unsigned long low_power_freq;
>  };
>
>  struct hfi_platform {
>         unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec);
>         unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
> +       unsigned long (*codec_lp_freq)(u32 session_type, u32 codec);
>         void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
>         const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
>         u8 (*num_vpp_pipes)(void);
> @@ -63,5 +65,7 @@ unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 code
>                                               u32 session_type);
>  unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec,
>                                               u32 session_type);
> +unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec,
> +                                            u32 session_type);
>  u8 hfi_platform_num_vpp_pipes(enum hfi_version version);
>  #endif
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> index 3848bb6..3f7f527 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> @@ -262,14 +262,14 @@ static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
>  }
>
>  static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
> -       { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
> -       { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
> -       { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
> -       { V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
> -       { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
> -       { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
> -       { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
> -       { V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
> +       { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10, 320 },
> +       { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10, 320 },
> +       { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10, 320 },
> +       { V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10, 200 },
> +       { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10, 200 },
> +       { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10, 200 },
> +       { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10, 200 },
> +       { V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10, 200 },
>  };
>
>  static const struct hfi_platform_codec_freq_data *
> @@ -311,9 +311,21 @@ static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
>         return 0;
>  }
>
> +static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> +{
> +       const struct hfi_platform_codec_freq_data *data;
> +
> +       data = get_codec_freq_data(session_type, codec);
> +       if (data)
> +               return data->low_power_freq;
> +
> +       return 0;
> +}
> +
>  const struct hfi_platform hfi_plat_v4 = {
>         .codec_vpp_freq = codec_vpp_freq,
>         .codec_vsp_freq = codec_vsp_freq,
> +       .codec_lp_freq = codec_lp_freq,
>         .codecs = get_codecs,
>         .capabilities = get_capabilities,
>  };
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> index 2278be1..15d0dc8 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> @@ -262,14 +262,14 @@ static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
>  }
>
>  static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
> -       { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 25 },
> -       { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 25 },
> -       { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 60 },
> -       { V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 25 },
> -       { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 25 },
> -       { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 25 },
> -       { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 60 },
> -       { V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 60 },
> +       { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 25, 320 },
> +       { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 25, 320 },
> +       { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 60, 320 },
> +       { V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 25, 200 },
> +       { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 25, 200 },
> +       { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 25, 200 },
> +       { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 60, 200 },
> +       { V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 60, 200 },
>  };
>
>  static const struct hfi_platform_codec_freq_data *
> @@ -311,6 +311,17 @@ static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
>         return 0;
>  }
>
> +static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> +{
> +       const struct hfi_platform_codec_freq_data *data;
> +
> +       data = get_codec_freq_data(session_type, codec);
> +       if (data)
> +               return data->low_power_freq;
> +
> +       return 0;
> +}
> +
>  static u8 num_vpp_pipes(void)
>  {
>         return 4;
> @@ -319,6 +330,7 @@ static u8 num_vpp_pipes(void)
>  const struct hfi_platform hfi_plat_v6 = {
>         .codec_vpp_freq = codec_vpp_freq,
>         .codec_vsp_freq = codec_vsp_freq,
> +       .codec_lp_freq = codec_lp_freq,
>         .codecs = get_codecs,
>         .capabilities = get_capabilities,
>         .num_vpp_pipes = num_vpp_pipes,
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 43c4e3d..a3f3e31 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -492,8 +492,50 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>         return 0;
>  }
>
> +static inline int power_save_mode_enable(struct venus_inst *inst,
> +                                        bool enable)
> +{
> +       struct venc_controls *enc_ctr = &inst->controls.enc;
> +       const u32 ptype = HFI_PROPERTY_CONFIG_VENC_PERF_MODE;
> +       u32 venc_mode;
> +       int ret = 0;
> +
> +       if (inst->session_type != VIDC_SESSION_TYPE_ENC)
> +               return 0;
> +
> +       if (enc_ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
> +               enable = false;
> +
> +       venc_mode = enable ? HFI_VENC_PERFMODE_POWER_SAVE :
> +               HFI_VENC_PERFMODE_MAX_QUALITY;
> +
> +       ret = hfi_session_set_property(inst, ptype, &venc_mode);
> +       if (ret)
> +               return ret;
> +
> +       inst->flags = enable ? inst->flags | VENUS_LOW_POWER :
> +               inst->flags & ~VENUS_LOW_POWER;
> +
> +       return ret;
> +}
> +
> +static int move_core_to_power_save_mode(struct venus_core *core,
> +                                       u32 core_id)
> +{
> +       struct venus_inst *inst = NULL;
> +
> +       mutex_lock(&core->lock);
> +       list_for_each_entry(inst, &core->instances, list) {
> +               if (inst->clk_data.core_id == core_id &&
> +                   inst->session_type == VIDC_SESSION_TYPE_ENC)
> +                       power_save_mode_enable(inst, true);
> +       }
> +       mutex_unlock(&core->lock);
> +       return 0;
> +}
> +
>  static void
> -min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load)
> +min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool low_power)
>  {
>         u32 mbs_per_sec, load, core1_load = 0, core2_load = 0;
>         u32 cores_max = core_num_max(inst);
> @@ -511,7 +553,14 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load)
>                 if (inst_pos->state != INST_START)
>                         continue;
>
> -               vpp_freq = inst_pos->clk_data.vpp_freq;
> +               if (inst->session_type == VIDC_SESSION_TYPE_DEC)
> +                       vpp_freq = inst_pos->clk_data.vpp_freq;
> +               else if (inst->session_type == VIDC_SESSION_TYPE_ENC)
> +                       vpp_freq = low_power ? inst_pos->clk_data.vpp_freq :
> +                               inst_pos->clk_data.low_power_freq;
> +               else
> +                       continue;
> +
>                 coreid = inst_pos->clk_data.core_id;
>
>                 mbs_per_sec = load_per_instance(inst_pos);
> @@ -543,9 +592,11 @@ static int decide_core(struct venus_inst *inst)
>  {
>         const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>         struct venus_core *core = inst->core;
> -       u32 min_coreid, min_load, inst_load;
> +       u32 min_coreid, min_load, cur_inst_load;
> +       u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
>         struct hfi_videocores_usage_type cu;
>         unsigned long max_freq;
> +       int ret = 0;
>
>         if (legacy_binding) {
>                 if (inst->session_type == VIDC_SESSION_TYPE_DEC)
> @@ -559,23 +610,43 @@ static int decide_core(struct venus_inst *inst)
>         if (inst->clk_data.core_id != VIDC_CORE_ID_DEFAULT)
>                 return 0;
>
> -       inst_load = load_per_instance(inst);
> -       inst_load *= inst->clk_data.vpp_freq;
> -       max_freq = core->res->freq_tbl[0].freq;
> +       cur_inst_load = load_per_instance(inst);
> +       cur_inst_load *= inst->clk_data.vpp_freq;
> +       /*TODO : divide this inst->load by work_route */
>
> -       min_loaded_core(inst, &min_coreid, &min_load);
> +       cur_inst_lp_load = load_per_instance(inst);
> +       cur_inst_lp_load *= inst->clk_data.low_power_freq;
> +       /*TODO : divide this inst->load by work_route */
>
> -       if ((inst_load + min_load) > max_freq) {
> -               dev_warn(core->dev, "HW is overloaded, needed: %u max: %lu\n",
> -                        inst_load, max_freq);
> +       max_freq = core->res->freq_tbl[0].freq;
> +
> +       min_loaded_core(inst, &min_coreid, &min_load, false);
> +       min_loaded_core(inst, &min_lp_coreid, &min_lp_load, true);
> +
> +       if (cur_inst_load + min_load <= max_freq) {
> +               inst->clk_data.core_id = min_coreid;
> +               cu.video_core_enable_mask = min_coreid;
> +       } else if (cur_inst_lp_load + min_load <= max_freq) {
> +               /* Move current instance to LP and return */
> +               inst->clk_data.core_id = min_coreid;
> +               cu.video_core_enable_mask = min_coreid;
> +               power_save_mode_enable(inst, true);
> +       } else if (cur_inst_lp_load + min_lp_load <= max_freq) {
> +               /* Move all instances to LP mode and return */
> +               inst->clk_data.core_id = min_lp_coreid;
> +               cu.video_core_enable_mask = min_lp_coreid;
> +               move_core_to_power_save_mode(core, min_lp_coreid);
> +       } else {
> +               dev_warn(core->dev, "HW can't support this load");
>                 return -EINVAL;
>         }
>
> -       inst->clk_data.core_id = min_coreid;
> -       cu.video_core_enable_mask = min_coreid;
> -
>  done:
> -       return hfi_session_set_property(inst, ptype, &cu);
> +       ret = hfi_session_set_property(inst, ptype, &cu);
> +       if (ret)
> +               return ret;
> +
> +       return ret;
>  }
>
>  static int acquire_core(struct venus_inst *inst)
> @@ -936,7 +1007,7 @@ static int core_power_v4(struct device *dev, int on)
>  static unsigned long calculate_inst_freq(struct venus_inst *inst,
>                                          unsigned long filled_len)
>  {
> -       unsigned long vpp_freq = 0, vsp_freq = 0;
> +       unsigned long vpp_freq_per_mb = 0, vpp_freq = 0, vsp_freq = 0;
>         u32 fps = (u32)inst->fps;
>         u32 mbs_per_sec;
>
> @@ -945,7 +1016,12 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
>         if (inst->state != INST_START)
>                 return 0;
>
> -       vpp_freq = mbs_per_sec * inst->clk_data.vpp_freq;
> +       if (inst->session_type == VIDC_SESSION_TYPE_ENC)
> +               vpp_freq_per_mb = inst->flags & VENUS_LOW_POWER ?
> +                       inst->clk_data.low_power_freq :
> +                       inst->clk_data.vpp_freq;
> +
> +       vpp_freq = mbs_per_sec * vpp_freq_per_mb;
>         /* 21 / 20 is overhead factor */
>         vpp_freq += vpp_freq / 20;
>         vsp_freq = mbs_per_sec * inst->clk_data.vsp_freq;
> --
> 2.7.4
>

Tested-by: Fritz Koenig <frkoenig@chromium.org>
