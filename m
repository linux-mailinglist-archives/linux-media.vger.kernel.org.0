Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BF59CC27
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 11:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbfHZJFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 05:05:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33474 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726892AbfHZJFk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 05:05:40 -0400
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 9DAFE882F2
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 09:05:39 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id o21so9795228otj.7
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 02:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pf0od/ydEpsj8eYoAeUSxte6eTJFUm2q5JY8yieoQPc=;
        b=H3fn7NBX/MrBj4fl3jYS7YlmlnCVUpoj/Hk7OnAq7dxQfoqq/Ed0aowOMWod9S7wZO
         G+bscI2wJhY/ifDWwDkhElq97EFuoO6OwYXobiwBbsYm/KrRCxWelP+fFcDZ7FhvC/fo
         R0w52mchLLa7qWrnom5IMlIwKXGMMlM7LLNMTJkR0cdg4neGUdOMCZnidcGloZg5N0G+
         kQxPbQyfv/zSnM8XyPkJUnU6uQAoHrrZpOZS8/frnaD6IDedrU8/bvjpJ6EbBkYnl5HB
         9NPIWcXL6i4KnZD55cUtzgRQAHIx01TjdqRPfCQOKrezU2rX/hUdGq+cao2saQuSEEsA
         d7iA==
X-Gm-Message-State: APjAAAUBrCOx5Oor5cNP8hEx3jBdY22KUeyOQ4Vr6PhPhfuF2RPkSEIV
        g0dUiztwOHkT2WeZhsHfqQpiJ8cFaIuQZTPZGlmKwcbYlQlplmlyBYnsC+xf53B7CtBeK4Q2SK4
        sYTD6wKywiCx4QqIIGRFjHG1+dtEzxj0X+J2Ih1w=
X-Received: by 2002:aca:6044:: with SMTP id u65mr11892855oib.16.1566810339076;
        Mon, 26 Aug 2019 02:05:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6H8Fg7W2oc2wq8ffkDgehZzTcLXDKkoiifmkdLxxc8Ea0EDRhv12gfPfS+rY0ECYwJhRxNwXrOoiFrpyfB14=
X-Received: by 2002:aca:6044:: with SMTP id u65mr11892839oib.16.1566810338771;
 Mon, 26 Aug 2019 02:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com> <20190814104520.6001-2-darekm@google.com>
 <bc3de8802b695fabb9522333de3a7071b02b47cb.camel@redhat.com>
In-Reply-To: <bc3de8802b695fabb9522333de3a7071b02b47cb.camel@redhat.com>
From:   Ben Skeggs <bskeggs@redhat.com>
Date:   Mon, 26 Aug 2019 19:05:27 +1000
Message-ID: <CABDvA=mK=4zK5Yn0Ro5oy0Pwa-JKBEq3fWpFJkHmBviexd7VWg@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] drm_dp_cec: add connector info support.
To:     Lyude Paul <lyude@redhat.com>
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>,
        Anthony Koo <Anthony.Koo@amd.com>,
        Thomas Lim <Thomas.Lim@amd.com>,
        David Francis <David.Francis@amd.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Imre Deak <imre.deak@intel.com>,
        Manasi Navare <manasi.d.navare@intel.com>,
        Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
        amd-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
        intel-gfx@lists.freedesktop.org,
        nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 16, 2019 at 4:10 AM Lyude Paul <lyude@redhat.com> wrote:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

>
> On Wed, 2019-08-14 at 12:44 +0200, Dariusz Marcinkiewicz wrote:
> > Pass the connector info to the CEC adapter. This makes it possible
> > to associate the CEC adapter with the corresponding drm connector.
> >
> > Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
> >  drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++++++++-------
> >  drivers/gpu/drm/i915/display/intel_dp.c       |  4 +--
> >  drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +--
> >  include/drm/drm_dp_helper.h                   | 17 ++++++-------
> >  5 files changed, 27 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 16218a202b591..5ec14efd4d8cb 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -416,7 +416,7 @@ void amdgpu_dm_initialize_dp_connector(struct
> > amdgpu_display_manager *dm,
> >
> >       drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> > -                                   aconnector->base.name, dm->adev->dev);
> > +                                   &aconnector->base);
> >       aconnector->mst_mgr.cbs = &dm_mst_cbs;
> >       drm_dp_mst_topology_mgr_init(
> >               &aconnector->mst_mgr,
> > diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> > index b15cee85b702b..b457c16c3a8bb 100644
> > --- a/drivers/gpu/drm/drm_dp_cec.c
> > +++ b/drivers/gpu/drm/drm_dp_cec.c
> > @@ -8,7 +8,9 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/slab.h>
> > +#include <drm/drm_connector.h>
> >  #include <drm/drm_dp_helper.h>
> > +#include <drm/drmP.h>
> >  #include <media/cec.h>
> >
> >  /*
> > @@ -295,7 +297,10 @@ static void drm_dp_cec_unregister_work(struct work_struct
> > *work)
> >   */
> >  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> >  {
> > -     u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD;
> > +     struct drm_connector *connector = aux->cec.connector;
> > +     u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
> > +                    CEC_CAP_CONNECTOR_INFO;
> > +     struct cec_connector_info conn_info;
> >       unsigned int num_las = 1;
> >       u8 cap;
> >
> > @@ -344,13 +349,17 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const
> > struct edid *edid)
> >
> >       /* Create a new adapter */
> >       aux->cec.adap = cec_allocate_adapter(&drm_dp_cec_adap_ops,
> > -                                          aux, aux->cec.name, cec_caps,
> > +                                          aux, connector->name, cec_caps,
> >                                            num_las);
> >       if (IS_ERR(aux->cec.adap)) {
> >               aux->cec.adap = NULL;
> >               goto unlock;
> >       }
> > -     if (cec_register_adapter(aux->cec.adap, aux->cec.parent)) {
> > +
> > +     cec_fill_conn_info_from_drm(&conn_info, connector);
> > +     cec_s_conn_info(aux->cec.adap, &conn_info);
> > +
> > +     if (cec_register_adapter(aux->cec.adap, connector->dev->dev)) {
> >               cec_delete_adapter(aux->cec.adap);
> >               aux->cec.adap = NULL;
> >       } else {
> > @@ -406,22 +415,20 @@ EXPORT_SYMBOL(drm_dp_cec_unset_edid);
> >  /**
> >   * drm_dp_cec_register_connector() - register a new connector
> >   * @aux: DisplayPort AUX channel
> > - * @name: name of the CEC device
> > - * @parent: parent device
> > + * @connector: drm connector
> >   *
> >   * A new connector was registered with associated CEC adapter name and
> >   * CEC adapter parent device. After registering the name and parent
> >   * drm_dp_cec_set_edid() is called to check if the connector supports
> >   * CEC and to register a CEC adapter if that is the case.
> >   */
> > -void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char *name,
> > -                                struct device *parent)
> > +void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> > +                                struct drm_connector *connector)
> >  {
> >       WARN_ON(aux->cec.adap);
> >       if (WARN_ON(!aux->transfer))
> >               return;
> > -     aux->cec.name = name;
> > -     aux->cec.parent = parent;
> > +     aux->cec.connector = connector;
> >       INIT_DELAYED_WORK(&aux->cec.unregister_work,
> >                         drm_dp_cec_unregister_work);
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 1092499115760..de2486fe7bf2d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5497,7 +5497,6 @@ static int
> >  intel_dp_connector_register(struct drm_connector *connector)
> >  {
> >       struct intel_dp *intel_dp = intel_attached_dp(connector);
> > -     struct drm_device *dev = connector->dev;
> >       int ret;
> >
> >       ret = intel_connector_register(connector);
> > @@ -5512,8 +5511,7 @@ intel_dp_connector_register(struct drm_connector
> > *connector)
> >       intel_dp->aux.dev = connector->kdev;
> >       ret = drm_dp_aux_register(&intel_dp->aux);
> >       if (!ret)
> > -             drm_dp_cec_register_connector(&intel_dp->aux,
> > -                                           connector->name, dev->dev);
> > +             drm_dp_cec_register_connector(&intel_dp->aux, connector);
> >       return ret;
> >  }
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
> > b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > index 330d7d29a6e34..8aa703347eb54 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > @@ -1416,8 +1416,7 @@ nouveau_connector_create(struct drm_device *dev,
> >       switch (type) {
> >       case DRM_MODE_CONNECTOR_DisplayPort:
> >       case DRM_MODE_CONNECTOR_eDP:
> > -             drm_dp_cec_register_connector(&nv_connector->aux,
> > -                                           connector->name, dev->dev);
> > +             drm_dp_cec_register_connector(&nv_connector->aux, connector);
> >               break;
> >       }
> >
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 8364502f92cfe..7972b925a952b 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1230,20 +1230,19 @@ struct drm_dp_aux_msg {
> >
> >  struct cec_adapter;
> >  struct edid;
> > +struct drm_connector;
> >
> >  /**
> >   * struct drm_dp_aux_cec - DisplayPort CEC-Tunneling-over-AUX
> >   * @lock: mutex protecting this struct
> >   * @adap: the CEC adapter for CEC-Tunneling-over-AUX support.
> > - * @name: name of the CEC adapter
> > - * @parent: parent device of the CEC adapter
> > + * @connector: the connector this CEC adapter is associated with
> >   * @unregister_work: unregister the CEC adapter
> >   */
> >  struct drm_dp_aux_cec {
> >       struct mutex lock;
> >       struct cec_adapter *adap;
> > -     const char *name;
> > -     struct device *parent;
> > +     struct drm_connector *connector;
> >       struct delayed_work unregister_work;
> >  };
> >
> > @@ -1451,8 +1450,8 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum
> > drm_dp_quirk quirk)
> >
> >  #ifdef CONFIG_DRM_DP_CEC
> >  void drm_dp_cec_irq(struct drm_dp_aux *aux);
> > -void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char *name,
> > -                                struct device *parent);
> > +void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> > +                                struct drm_connector *connector);
> >  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
> >  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid);
> >  void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
> > @@ -1461,9 +1460,9 @@ static inline void drm_dp_cec_irq(struct drm_dp_aux
> > *aux)
> >  {
> >  }
> >
> > -static inline void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> > -                                              const char *name,
> > -                                              struct device *parent)
> > +static inline void
> > +drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> > +                           struct drm_connector *connector)
> >  {
> >  }
> >
>
