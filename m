Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2A86A576D
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 15:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730658AbfIBNLe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 09:11:34 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45924 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfIBNLe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 09:11:34 -0400
Received: by mail-qt1-f195.google.com with SMTP id r15so9875338qtn.12
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2019 06:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PZv22NgyAy4cpGO8nvyQHGric91X1UzIHSt4+HMcQy0=;
        b=VfyOjtZ8aWgjvf651FHyhOAmwULu+NSuKIFmWFDbTRWli+KD2QjI1GYeqiw61Zjm2m
         7aaaBlmkKkRFGyH+0e/2tfli/Lzx3ClE2/e2G5QLJQYnubJJ3JYzZLvgyXXSK4+1L+EE
         Z7LbQ3jZDzcbqs+UdWR7g5QpEcTndIQMh46gYQkp6+SayViDEjVz6qOCIWbXrzCYf9qd
         7mQnrP/NU6T4dEn9pN39cR1iiOpk8+HPk9FvMT4BxOIGOTrnmYFYwqdtsOMeIh+WZXQZ
         YbLPKeJAaT7hmIolpfVwwIm0YOCT6huuORR8Dat7ZQQzEFC7TrlK3q7zqruDx4uHmJk/
         oj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PZv22NgyAy4cpGO8nvyQHGric91X1UzIHSt4+HMcQy0=;
        b=HhxNMnxRzLmFpyFgsXFQWwTMWqafXFHQKuJuXIT8E5HX8PJI+A3HM0YDkOl+e/Qe6Q
         BiwyZnETNksPOgNmjYmTHx5grUrgsgQH13Ghz91a99f2Nc28/LlSupBYWl1VhaD069pH
         dOQKN7uOeNnTB1TS2xjaJBeGLDpg9tu2l6bCKNyGXdUFFgW8CXyH2pDekGnQi9UWmIDK
         AZE3IWbJtYd0q2h+U7I1wR8dK0roUTvM/sj9QUw0UlTxvjqQvbIMzMaA+89Fd4JYWcWd
         gCNiB7wEt66oOGRGfIjxMTBY59HivSMkIMGp2tpO2dlgXkAAujj2PMSb5FfSiQttLUgO
         mznw==
X-Gm-Message-State: APjAAAUnhdMp/AZN/RB/thqHH0bWf9/E5gHckw5OGn8oTLcYk4I7IYyI
        hMOxw6ZaGrywFPmcjrB9NNIjZ6XqwQsoQTvJBWD0qg==
X-Google-Smtp-Source: APXvYqxEna7P0g0Bcyf5yaueoracYZLNFgddoZxTQyK2mxM0F5w6o3XIUtpvDIp7islXuRjcdOl+JjDzPJJdEmQZDWQ=
X-Received: by 2002:ac8:60d6:: with SMTP id i22mr24868461qtm.250.1567429893126;
 Mon, 02 Sep 2019 06:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com> <20190814104520.6001-7-darekm@google.com>
 <00515839-a4bd-6721-8563-a16fbbaa7159@xs4all.nl>
In-Reply-To: <00515839-a4bd-6721-8563-a16fbbaa7159@xs4all.nl>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Mon, 2 Sep 2019 15:11:22 +0200
Message-ID: <CA+M3ks6zkg9nh39tLr-fzHR8_UJeaxADTM9yeRSECtkyBuUbFw@mail.gmail.com>
Subject: Re: [PATCH v7 6/9] drm: sti: use cec_notifier_conn_(un)register
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeu. 22 ao=C3=BBt 2019 =C3=A0 10:11, Hans Verkuil <hverkuil-cisco@xs4all=
.nl> a =C3=A9crit :
>
> Adding Benjamin Gaignard.
>
> Benjamin, can you take a look at this and Ack it (or merge it if you pref=
er) and
> ideally test it as well. This is the only patch in this series that I cou=
ld not
> test since I don't have any hardware.

Looks good for me.

Applied on drm-misc-next,
Thanks,
Benjamin

>
> Regards,
>
>         Hans
>
> On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
> > Use the new cec_notifier_conn_(un)register() functions to
> > (un)register the notifier for the HDMI connector, and fill
> > in the cec_connector_info.
> >
> > Changes since v2:
> >       Don't invalidate physical address before unregistering the
> >       notifier.
> >
> > Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> > ---
> >  drivers/gpu/drm/sti/sti_hdmi.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_h=
dmi.c
> > index 9862c322f0c4a..bd15902b825ad 100644
> > --- a/drivers/gpu/drm/sti/sti_hdmi.c
> > +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> > @@ -1256,6 +1256,7 @@ static int sti_hdmi_bind(struct device *dev, stru=
ct device *master, void *data)
> >       struct drm_device *drm_dev =3D data;
> >       struct drm_encoder *encoder;
> >       struct sti_hdmi_connector *connector;
> > +     struct cec_connector_info conn_info;
> >       struct drm_connector *drm_connector;
> >       struct drm_bridge *bridge;
> >       int err;
> > @@ -1318,6 +1319,14 @@ static int sti_hdmi_bind(struct device *dev, str=
uct device *master, void *data)
> >               goto err_sysfs;
> >       }
> >
> > +     cec_fill_conn_info_from_drm(&conn_info, drm_connector);
> > +     hdmi->notifier =3D cec_notifier_conn_register(&hdmi->dev, NULL,
> > +                                                 &conn_info);
> > +     if (!hdmi->notifier) {
> > +             hdmi->drm_connector =3D NULL;
> > +             return -ENOMEM;
> > +     }
> > +
> >       /* Enable default interrupts */
> >       hdmi_write(hdmi, HDMI_DEFAULT_INT, HDMI_INT_EN);
> >
> > @@ -1331,6 +1340,9 @@ static int sti_hdmi_bind(struct device *dev, stru=
ct device *master, void *data)
> >  static void sti_hdmi_unbind(struct device *dev,
> >               struct device *master, void *data)
> >  {
> > +     struct sti_hdmi *hdmi =3D dev_get_drvdata(dev);
> > +
> > +     cec_notifier_conn_unregister(hdmi->notifier);
> >  }
> >
> >  static const struct component_ops sti_hdmi_ops =3D {
> > @@ -1436,10 +1448,6 @@ static int sti_hdmi_probe(struct platform_device=
 *pdev)
> >               goto release_adapter;
> >       }
> >
> > -     hdmi->notifier =3D cec_notifier_get(&pdev->dev);
> > -     if (!hdmi->notifier)
> > -             goto release_adapter;
> > -
> >       hdmi->reset =3D devm_reset_control_get(dev, "hdmi");
> >       /* Take hdmi out of reset */
> >       if (!IS_ERR(hdmi->reset))
> > @@ -1459,14 +1467,11 @@ static int sti_hdmi_remove(struct platform_devi=
ce *pdev)
> >  {
> >       struct sti_hdmi *hdmi =3D dev_get_drvdata(&pdev->dev);
> >
> > -     cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID)=
;
> > -
> >       i2c_put_adapter(hdmi->ddc_adapt);
> >       if (hdmi->audio_pdev)
> >               platform_device_unregister(hdmi->audio_pdev);
> >       component_del(&pdev->dev, &sti_hdmi_ops);
> >
> > -     cec_notifier_put(hdmi->notifier);
> >       return 0;
> >  }
> >
> >
>
