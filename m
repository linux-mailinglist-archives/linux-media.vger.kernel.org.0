Return-Path: <linux-media+bounces-24996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C79A170E1
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 17:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08D673A24C8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 16:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD7A1EBFEB;
	Mon, 20 Jan 2025 16:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HczEbNtS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C805B1E0B66;
	Mon, 20 Jan 2025 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737392183; cv=none; b=beXJtfoT3WWe5GR6EweMajCimjNpAPBZil0qrPWENtKhGLWDXaYXK/3ZA/9o30yeoM0rVOxS0UAaak3EYalkDB4ktrvQyUWTsOcKwN8HyTEj8l0pQb1eTe8kQeZeHcmeW/bCsnQP0wQ8zqxQuDZX1QhXbLRbjfaUOTh01LZgBlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737392183; c=relaxed/simple;
	bh=zwHZs8IihsvM75UXiylxHAYRuLeRt/VvVCFJGjnOEEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1eJwMIpd86al8NMPUMmlmWZJ2UbTsplyW27fQw/k2aXvpaq0B1iKZVtOdvytcflE/Ca8fe4YFy3uxT5/p0basYrYOUsu8dCC9ncJ7CsVuoaTMyq/jfM7JA7E/og1yDNWn+oIsJNCQLr+1CKDWIknuR92tx9fIfCEnfy/rnyWBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HczEbNtS; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29e842cb9b4so1401244fac.2;
        Mon, 20 Jan 2025 08:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737392181; x=1737996981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBTKFm64zeVxsmK1OA1HXiKNddoRElmBx0NQjXwUk/g=;
        b=HczEbNtSTID7cobmD8rN1o81wdiqb3Zxj2+QqJ3KKaiBibmg/FycpiN0JrdSmV6Qn2
         ZLEs4Bj/kYn2lWvDzbcrbKG56g+NWn011MY3njnIynUsnFP7AEMiXc6On/5SrNju5Bfd
         P+mHlXOP7D9PscA5qnxR1NyB0sWrNJbOSdi0to2rL/HGl0kj18SxN/bvmeDjwdBiCL7g
         V8DVWiLhFWs+qV5UrxPP3f7ytVEHP+GYckIy/lgPkJlNXKxnkLFi3mQ6aoXVSQS/MCyZ
         JcY8trIP63/A6tasNrrlHrZenpvU/DqWqfHqq0G7jg8QHtlmrZjYOUxYSqH3KQ9vciNS
         kw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737392181; x=1737996981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBTKFm64zeVxsmK1OA1HXiKNddoRElmBx0NQjXwUk/g=;
        b=w1M0S6Yb5u8b7qVgA/spIfLXTF9tCwx3ur/F44XHWO8RHpCDj9ZQdBObBMsebU9Pus
         yTUO1KsVokIX9WzL4AUR69m+z/mDTVb92b212H1USMVncmixG6ULli18T4u1RNmO1JQY
         Jrbw6GkEqLmj2cO7Fs6WMXjKmkPlduav01QUVzSXTUyPtmakV70sVEok1MNnCTcgNFh2
         1F8rPl6hbLSmQhekZ1Guzv9Ge4Vqnk48Hxi5HFXF7nXPjrGJuZf5g90qVg0kRdz+vKGg
         OKX3Au33Mknq/m8CQhh5UTIZaF1mKlcKzOexyznHUMugFTS0nJoU2/ub//ZYKpf+Snei
         py4A==
X-Forwarded-Encrypted: i=1; AJvYcCUvhQ8TMyupdgBu7xOpQbQWSlqm7kuPjiQwqtyxsuwChOgAOK3onpoHDYaV6etZSbTlNejzAuBFP49K@vger.kernel.org, AJvYcCVIJdHRMT6/timsBEXUsm/mHYd9nTTrxr0s4QYdHHu4WsF4q6riVyHxjOVUDM+sP7FZSjPjS5INq9nrcj+s@vger.kernel.org, AJvYcCXD+kYpVZuBM3tDQ3ZHxAxhpIr+oPKprcPxs6mcvJR2yH8K0GfNVJa5BS1VzfX4YJVvX3J/VyKd3cYlee4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyodGmDkDEhlf6chlDNOeJV0Sw+lmnXxeA6r/YJYjGlw4Cp+/an
	q86oCD2mqo3QK5v2wH9Y0G6ahYBHkGXbcEXRT8d62Pb2gl0Lidi4RmQ8WYo0EEkb4n/teBQSiof
	3HGg1Ll47tD7KP8IRfbHMYrg+qRo=
X-Gm-Gg: ASbGncthZmYxmZbb3xL9u39YEXiW3i+Mhg7XxQdM2TBANhZe9qqgEIDKmycWugyyDpi
	u/3UubzhZvOSbERVAORlI0p70puhScU5KJuU9c/M5CbwHufsb2+Lq
X-Google-Smtp-Source: AGHT+IEoP2e+7bSwz6pgkVvjG9/PFKiXeIWQGmnmyTFk/oD8l+kOF1PpHfZH6vSBLZJsIs0ulv7986+m8aR9Wrs02S8=
X-Received: by 2002:a05:6871:5e15:b0:29e:5c94:5afd with SMTP id
 586e51a60fabf-2b1c099e645mr7442126fac.1.1737392180686; Mon, 20 Jan 2025
 08:56:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-2-jason-jh.lin@mediatek.com> <CABb+yY2t7rBnoBEf3Pog0eRW_zvb0YggbgKBspnZOS1bsyQBPQ@mail.gmail.com>
 <CAGXv+5Eg_5CFiCYPk29wvjPq03wO9js5nQNhF8A_kB9+K452uw@mail.gmail.com>
In-Reply-To: <CAGXv+5Eg_5CFiCYPk29wvjPq03wO9js5nQNhF8A_kB9+K452uw@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 20 Jan 2025 10:56:09 -0600
X-Gm-Features: AbW1kvbxZOSlVPP7JzmeHsWfSHUBXc8gyLQ1WLr-4v-ZhYWtO-p105-4I2g0SiA
Message-ID: <CABb+yY3U9Ud5KNQ-4V9m327ZdumDPperRXvkaVV2RbKscSYH-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 12:46=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Sun, Jan 19, 2025 at 5:24=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.=
com> wrote:
> >
> > On Thu, Dec 19, 2024 at 11:08=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@med=
iatek.com> wrote:
> > >
> > > 1. Add compatible name and iommus property to mediatek,gce-mailbox.ya=
ml
> > >    for MT8196.
> > >
> > >    - The compatible name "mediatek,mt8196-gce-mailbox" is added to
> > >      ensure that the device tree can correctly identify and configure
> > >      the GCE mailbox for the MT8196 SoC.
> > >
> > >    - The iommus property is added to specify the IOMMU configuration
> > >      for the GCE mailbox, ensuring proper memory management and acces=
s
> > >      control.
> > >
> > > 2. Add the Global Command Engine (GCE) binding header to define the
> > >    abstrct symbol binding to the GCE hardware settings of GCE Thread
> > >    Priority, GCE Subsys ID and GCE Event for MT8196.
> > >
> > >    - GCE Thread Priority: Defined to configure the priority level for
> > >      each GCE hardware thread. This is necessary for proper schedulin=
g
> > >      and execution of commands in the GCE.
> > >
> > >    - GCE Subsys ID: Defined to specify the subsystem ID for GCE clien=
ts.
> > >      This is used to correctly address and access different subsystem=
s
> > >      within the GCE.
> > >
> > >    - GCE Event: Defined to specify the events that the GCE can handle=
.
> > >      These events are used by the driver to synchronize and manage
> > >      hardware operations.
> > >
> > >    Examples of the binding usage in the driver code:
> > >    1) GCE Thread Priority:
> > >    - Defined in the header file: `#define CMDQ_THR_PRIO_4 4`
> > >    - Used in the Device Tree: `mboxes =3D <&gce0 0 CMDQ_THR_PRIO_4>;`
> > >    - Parsed and used in the driver to set thread priority:
> > >      ```c
> > >      static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox=
,i
> > >                                          const struct of_phandle_args=
 *sp)
> > >      {
> > >         thread->priority =3D sp->args[1];
> > >      }
> > >      // set GCE thread priority to the priority level 4 for GCE threa=
d 0
> > >      writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
> > >      ```
> > >
> > >    2) GCE Subsys ID:
> > >    - Defined in the header file: `#define SUBSYS_1c00XXXX 3`
> > >    - Used in the Device Tree:
> > >         `mediatek,gce-client-reg =3D <&gce SUBSYS_1c00XXXX 0x0000 0x1=
000>;`
> > >    - Parsed and used in the driver to configure subsys ID:
> > >      ```c
> > >      int cmdq_dev_get_client_reg(struct device *dev,
> > >                                  struct cmdq_client_reg *client_reg,
> > >                                  int idx)
> > >      {
> > >         client_reg->subsys =3D (u8)spec.args[0];
> > >         client_reg->offset =3D (u16)spec.args[1];
> > >      }
> > >      // GCE write the value to the register 0x1c000000 + 0x0000 + off=
set
> > >      cmdq_pkt_write(cmdq_handle, client_reg->subsys,
> > >                     client_reg->offset + offset, value);
> > >      ```
> > >
> > >    3) GCE Event:
> > >    - Defined in the header file:
> > >         `#define CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0 574`
> > >    - Used in the Device Tree:
> > >         `mediatek,gce-events =3D <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>=
;`
> > >    - Parsed and used in the driver to handle events:
> > >      ```c
> > >      int mtk_crtc_create(struct drm_device *drm_dev,
> > >                          const unsigned int *path,
> > >                          unsigned int path_len, int priv_data_index,
> > >                          const struct mtk_drm_route *conn_routes,
> > >                          unsigned int num_conn_routes)
> > >      {
> > >         of_property_read_u32_index(priv->mutex_node,
> > >                                    "mediatek,gce-events", i,
> > >                                    &mtk_crtc->cmdq_event);
> > >      }
> > >      // GCE clear the STREAM_DONE event sent from DISP_MUTEX hardware
> > >      cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> > >      ```
> > >
> > > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > > ---
> > >  .../mailbox/mediatek,gce-mailbox.yaml         |    4 +
> > >  .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1415 +++++++++++++++=
++
> > >  2 files changed, 1419 insertions(+)
> > >  create mode 100644 include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> > >
> > > diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-m=
ailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbo=
x.yaml
> > > index cef9d7601398..73d6db34d64a 100644
> > > --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.=
yaml
> > > +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.=
yaml
> > > @@ -25,6 +25,7 @@ properties:
> > >            - mediatek,mt8188-gce
> > >            - mediatek,mt8192-gce
> > >            - mediatek,mt8195-gce
> > > +          - mediatek,mt8196-gce
> > >        - items:
> > >            - const: mediatek,mt6795-gce
> > >            - const: mediatek,mt8173-gce
> > > @@ -49,6 +50,9 @@ properties:
> > >      items:
> > >        - const: gce
> > >
> > > +  iommus:
> > > +    maxItems: 1
> > > +
> > >  required:
> > >    - compatible
> > >    - "#mbox-cells"
> > > diff --git a/include/dt-bindings/mailbox/mediatek,mt8196-gce.h b/incl=
ude/dt-bindings/mailbox/mediatek,mt8196-gce.h
> > > new file mode 100644
> > > index 000000000000..9e0700236033
> > > --- /dev/null
> > > +++ b/include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> > > @@ -0,0 +1,1415 @@
> >
> > 1415 ?  90% seem unnecessary.
> >
> > > +
> > > +/* GCE thread priority */
> > > +#define CMDQ_THR_PRIO_LOWEST   0
> > > +#define CMDQ_THR_PRIO_1                1
> > > +#define CMDQ_THR_PRIO_2                2
> > > +#define CMDQ_THR_PRIO_3                3
> > > +#define CMDQ_THR_PRIO_4                4
> > > +#define CMDQ_THR_PRIO_5                5
> > > +#define CMDQ_THR_PRIO_6                6
> > > +#define CMDQ_THR_PRIO_HIGHEST  7
> > >
> >  Only need to HIGHEST maybe
>
> Or maybe we could just get rid of them and describe the valid values
> and ordering in the YAML part?
>
> > > +
> > > +/* GCE subsys table */
> > > +#define SUBSYS_1300XXXX                0
> > > +#define SUBSYS_1400XXXX                1
> > > +#define SUBSYS_1401XXXX                2
> > > +#define SUBSYS_1402XXXX                3
> > > +#define SUBSYS_1502XXXX                4
> > > +#define SUBSYS_1880XXXX                5
> > > +#define SUBSYS_1881XXXX                6
> > > +#define SUBSYS_1882XXXX                7
> > > +#define SUBSYS_1883XXXX                8
> > > +#define SUBSYS_1884XXXX                9
> > > +#define SUBSYS_1000XXXX                10
> > > +#define SUBSYS_1001XXXX                11
> > > +#define SUBSYS_1002XXXX                12
> > > +#define SUBSYS_1003XXXX                13
> > > +#define SUBSYS_1004XXXX                14
> > > +#define SUBSYS_1005XXXX                15
> > > +#define SUBSYS_1020XXXX                16
> > > +#define SUBSYS_1028XXXX                17
> > > +#define SUBSYS_1700XXXX                18
> > > +#define SUBSYS_1701XXXX                19
> > > +#define SUBSYS_1702XXXX                20
> > > +#define SUBSYS_1703XXXX                21
> > > +#define SUBSYS_1800XXXX                22
> > > +#define SUBSYS_1801XXXX                23
> > > +#define SUBSYS_1802XXXX                24
> > > +#define SUBSYS_1804XXXX                25
> > > +#define SUBSYS_1805XXXX                26
> > > +#define SUBSYS_1808XXXX                27
> > > +#define SUBSYS_180aXXXX                28
> > > +#define SUBSYS_180bXXXX                29
> > > +#define SUBSYS_NO_SUPPORT      99
> > > +
> > Keep only that you use now or plan in  the near future. But ok.
> >
> > > +/* GCE-D hardware events */
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF0                                =
           0
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF1                                =
           1
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF2                                =
           2
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF3                                =
           3
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF4                                =
           4
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF5                                =
           5
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF6                                =
           6
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF7                                =
           7
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF8                                =
           8
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF9                                =
           9
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF10                               =
           10
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF11                               =
           11
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF12                               =
           12
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF13                               =
           13
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF14                               =
           14
> > > +#define CMDQ_EVENT_DISP0_STREAM_SOF15                               =
           15
> > >
> >  you mean
> >   #define CMDQ_EVENT_DISP0_STREAM_SOF(n)  n
> >
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL0                            =
           16
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL1                            =
           17
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL2                            =
           18
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL3                            =
           19
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL4                            =
           20
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL5                            =
           21
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL6                            =
           22
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL7                            =
           23
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL8                            =
           24
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL9                            =
           25
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL10                           =
           26
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL11                           =
           27
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL12                           =
           28
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL13                           =
           29
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL14                           =
           30
> > > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL15                           =
           31
> >
> >    #define CMDQ_EVENT_DISP0_FRAME_DONE_SEL(n)
> >             (16 + n)
> >
> > > +#define CMDQ_EVENT_DISP0_DISP_WDMA0_TARGET_LINE_END_ENG_EVENT       =
           32
> > > +#define CMDQ_EVENT_DISP0_DISP_WDMA0_SW_RST_DONE_ENG_EVENT           =
           33
> > > +#define CMDQ_EVENT_DISP0_DISP_POSTMASK1_RST_DONE_ENG_EVENT          =
           34
> > > +#define CMDQ_EVENT_DISP0_DISP_POSTMASK0_RST_DONE_ENG_EVENT          =
           35
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_TIMEOUT_ENG_EVENT              =
           36
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT0          =
           37
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT1          =
           38
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT2          =
           39
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT3          =
           40
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT4          =
           41
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT5          =
           42
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT6          =
           43
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT7          =
           44
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT8          =
           45
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT9          =
           46
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT10         =
           47
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT11         =
           48
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT12         =
           49
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT13         =
           50
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT14         =
           51
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT15         =
           52
> > > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_GET_RELEASE_ENG_EVENT          =
           53
> > > +#define CMDQ_EVENT_DISP0_DISP_MDP_RDMA0_SW_RST_DONE_ENG_EVENT       =
           54
> > > +
> >  keep only the used ones and use
>
> This is the only publicly available table of the numbers. Having
> the complete table somewhere would be nice. OOTH the numbers being
> like IRQ or DRQ numbers, don't actually get used in the driver.
> So maybe we could keep the full list but move it under the dts directory?
>
Why introduce bloat in the kernel? We shouldn't be carrying what are
basically 'addition' tables, not even 'multiplication' ;)
The same knowledge can be represented concisely by the formula
  #define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT(n)  (n + 37)
especially for ~50 char defines

thnx

