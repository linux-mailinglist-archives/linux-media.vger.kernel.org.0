Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCA9790276
	for <lists+linux-media@lfdr.de>; Fri,  1 Sep 2023 21:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347987AbjIAT0R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Sep 2023 15:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjIAT0R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Sep 2023 15:26:17 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3743710E0
        for <linux-media@vger.kernel.org>; Fri,  1 Sep 2023 12:26:14 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3a812843f0fso1392277b6e.2
        for <linux-media@vger.kernel.org>; Fri, 01 Sep 2023 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693596373; x=1694201173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHGVVmsyhgtP/USdgG81z47GsFqLU0aEkIKpPuhjrVY=;
        b=UfhyjSCO8WixiWY4PW+IfcuhoMYVw9YIgx+CFkuheWDIQ9IHj+M5r/I/onHUZTQuHv
         3u8XH0R06TM8Yv2I6hWJWT6gNVISePOlz6w+mrv8JEQAcry82pwElw1h/5GCzP+LHM/O
         3FtqG+kY3b6KT1jXT6ToyiQf6oWC4JwH3OShRgdKkI58JkVhLrCaK9S/GDacfJf5GoZo
         bahHE0q1h1mnw4D2lRZguPFc154h4pMuFRUsbgIjktoI8t6ig/JGSJJmn6eV0TRHF4ni
         awZ27kuk3ojvBNadWDIqxu0v6apmxaToCaYJBy1q43XhLzsBniOhFFQhVR9RrwhX9qwF
         r1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693596373; x=1694201173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHGVVmsyhgtP/USdgG81z47GsFqLU0aEkIKpPuhjrVY=;
        b=Auwsd1MoxYNfUg7715cGoBkxdeYIcNTANyUg9fgIqDTxi4iNCNhZOh3jGA4zFKzoXn
         z+uHf88Ts1IUlzF2ZQ2t8QocNtrUwaa1PuutZ9oiSjGovjlK0P5fYKzuFhNnGDZo/SEX
         cSDSbXFC8eceLJRIY8XG7MyIagtYFbIOFyccXvyO2wJs23ag+XKJ2mStiKLyMvA9WOwU
         iFyoA0JoNyRD+IIdRQsVfcCZFO70YMX2wighsmnXkV+i1dk66hBwsgLKIyWzasuHRvwq
         k1OPIOYK4+oGb6qYsyMlrE7APn+6YAJsE8CNl33k8UVI19EOxzB0uldRM2jNcCreFt7e
         hy0A==
X-Gm-Message-State: AOJu0YzMcDZcXbsdQOib/2GtFb1xF9Kwp0ivjw6b7YK+CnAI5QzLVBJh
        QIKnYxDwT82Wy9Xjj+Vgtonw65YCYW4ltx32Kdo=
X-Google-Smtp-Source: AGHT+IELT//9p/zVUwrBfz6CRP8TgEMaXjDDvWWTOQPl8DxQAO2NTl05+hQEulowAVOhrR/GPBiiH7TKQgYbmDX+PAM=
X-Received: by 2002:a05:6808:14d1:b0:3a4:6691:9340 with SMTP id
 f17-20020a05680814d100b003a466919340mr4212325oiw.41.1693596373238; Fri, 01
 Sep 2023 12:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692884619.git.jani.nikula@intel.com> <4bdb407bf189fd922be022eb2f9564692377c81d.1692884619.git.jani.nikula@intel.com>
In-Reply-To: <4bdb407bf189fd922be022eb2f9564692377c81d.1692884619.git.jani.nikula@intel.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 1 Sep 2023 15:26:01 -0400
Message-ID: <CADnq5_OVm2HsLwDuDEU4npLJiZdTUL+_XnbqaoDS50a1LRWXfA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/edid: add drm_edid_is_digital()
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 24, 2023 at 9:46=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Checking edid->input & DRM_EDID_INPUT_DIGITAL is common enough to
> deserve a helper that also lets us abstract the raw EDID a bit better.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Seems to be a few additional users of this that could be converted:

drivers/gpu/drm/i915/display/intel_sdvo.c:        if (edid &&
edid->input & DRM_EDID_INPUT_DIGITAL)
drivers/gpu/drm/i915/display/intel_sdvo.c:    bool monitor_is_digital
=3D !!(edid->input & DRM_EDID_INPUT_DIGITAL);
drivers/gpu/drm/i915/display/intel_crt.c:        bool is_digital =3D
edid->input & DRM_EDID_INPUT_DIGITAL;
drivers/gpu/drm/i915/display/intel_hdmi.c:    if (edid && edid->input
& DRM_EDID_INPUT_DIGITAL) {
drivers/gpu/drm/gma500/psb_intel_sdvo.c:        if (edid->input &
DRM_EDID_INPUT_DIGITAL) {
drivers/gpu/drm/gma500/psb_intel_sdvo.c:            if (edid->input &
DRM_EDID_INPUT_DIGITAL)
drivers/gpu/drm/gma500/psb_intel_sdvo.c:        bool
monitor_is_digital =3D !!(edid->input & DRM_EDID_INPUT_DIGITAL);
drivers/gpu/drm/gma500/psb_intel_sdvo.c:    if (edid !=3D NULL &&
edid->input & DRM_EDID_INPUT_DIGITAL)
drivers/gpu/drm/gma500/cdv_intel_hdmi.c:        if (edid->input &
DRM_EDID_INPUT_DIGITAL) {
drivers/gpu/drm/display/drm_dp_helper.c:        edid->input &
DRM_EDID_INPUT_DIGITAL &&
drivers/gpu/drm/nouveau/nouveau_connector.c:            if
(nv_connector->edid->input & DRM_EDID_INPUT_DIGITAL)
drivers/gpu/drm/radeon/radeon_connectors.c:
!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
drivers/gpu/drm/radeon/radeon_connectors.c:
!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c:
!!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c:
!!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);




> ---
>  drivers/gpu/drm/drm_edid.c | 17 +++++++++++++++--
>  include/drm/drm_edid.h     |  1 +
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 340da8257b51..1dbb15439468 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3110,7 +3110,7 @@ drm_monitor_supports_rb(const struct drm_edid *drm_=
edid)
>                 return ret;
>         }
>
> -       return ((drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL) !=3D 0);
> +       return drm_edid_is_digital(drm_edid);
>  }
>
>  static void
> @@ -6519,7 +6519,7 @@ static void update_display_info(struct drm_connecto=
r *connector,
>         if (edid->revision < 3)
>                 goto out;
>
> -       if (!(edid->input & DRM_EDID_INPUT_DIGITAL))
> +       if (!drm_edid_is_digital(drm_edid))
>                 goto out;
>
>         info->color_formats |=3D DRM_COLOR_FORMAT_RGB444;
> @@ -7335,3 +7335,16 @@ static void _drm_update_tile_info(struct drm_conne=
ctor *connector,
>                 connector->tile_group =3D NULL;
>         }
>  }
> +
> +/**
> + * drm_edid_is_digital - is digital?
> + * @drm_edid: The EDID
> + *
> + * Return true if input is digital.
> + */
> +bool drm_edid_is_digital(const struct drm_edid *drm_edid)
> +{
> +       return drm_edid && drm_edid->edid &&
> +               drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
> +}
> +EXPORT_SYMBOL(drm_edid_is_digital);
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 48e93f909ef6..882d2638708e 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -612,6 +612,7 @@ const struct drm_edid *drm_edid_read_switcheroo(struc=
t drm_connector *connector,
>  int drm_edid_connector_update(struct drm_connector *connector,
>                               const struct drm_edid *edid);
>  int drm_edid_connector_add_modes(struct drm_connector *connector);
> +bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>
>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>                                   int ext_id, int *ext_index);
> --
> 2.39.2
>
