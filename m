Return-Path: <linux-media+bounces-24892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C4DA15EE7
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 22:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E07B31885F3D
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 21:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF6C1D31B8;
	Sat, 18 Jan 2025 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJEhYeu8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F4E1A304A;
	Sat, 18 Jan 2025 21:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737235465; cv=none; b=S++4TXvNz+NsvIFoomBZpD+CyvsOz4ubndVJToicWaNtBVzlaklFYC6Vt1Yi5xgtxIFYdfiRgHR0nxAytYqr88lEI1HJXfc/5TAVsjLVOw2/hDD4uTlIcMaSJ1S+EaN4DWgFJskcG3VGdoO965/agmg/9jewTVj+NrC94wkClLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737235465; c=relaxed/simple;
	bh=pln6YagGCOW7D4aUpl4NrRlH002y4SArqaG0lhmHoTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvwdByS1LunZI0xFzaJJuBD6HvRL+MeC8yqD+c5fbdJYbih/1Nyd3TSxwDRlh2IQu6HPACxyu1aqzmSa1T05DpAUpxngW/s7ceturXuaj58dtOI2S4zODgUQicFD1DFPcwnKge4KPE2gwHNX/s4FgEU1UcWS5FJPSIX5UI+OT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJEhYeu8; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5f6b65c89c4so651323eaf.2;
        Sat, 18 Jan 2025 13:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737235462; x=1737840262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpQ9mOc07i62I7AR5FsW12vuvrPC2qDqCHSgYwmcBJU=;
        b=iJEhYeu8SbawOlOg50Jqa29hWbJ1STsxsNpS1uKDvlKwOJxCwhcsY4n9Whkktc40+0
         NBDTPULP/Yy2/j8JlEJQhEQKOybo1l8ZHevnq2TNkm+FXu9f/m9d9yjQK6K3li9XTkXu
         KdnbzhnSK+KU4lld8DwurOsaoheMxaRkdfISXfHA0JiP8joFZWO9DFgKQtk119/8J0mY
         cemrasaQYk1DZhphuWhDF86OHXma0+8HJBPWIh824q8ptk5pg+AhegFmx3j7y13lEK9/
         i0654NDqmwp9PVKOuaUgLqPrwFN367YjAZmne9Sn46/2BbUrkiUYvGg9Zkfp+GkQan2w
         chqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737235462; x=1737840262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpQ9mOc07i62I7AR5FsW12vuvrPC2qDqCHSgYwmcBJU=;
        b=QZ32dbMSZA7UUQuvigpJ1mF7IJuaHungRaI+Te0gqZ2vLtDyyK6lu5nlkwkvBMTLbx
         TR1vQubCQteEjjvM1WaEr8t0GD/1EuEAUMWJ6JRudJ8NU3xSs9dXP92LZTAKlB6sIeyj
         4wMCNZITTqHpM7vN/1lT8TxGmq7Rvi4ACFkIwfaHRR5i+9a+ycUpUBmRuFZ285gtRYeZ
         7YRofx+X3lQWoD2ltPu4CfrnYcPsbHPGK85Wyf9gkLlb5UP7GqwexHrbW/EzvHDlX9Yb
         EnZ6cCx8i51h6fmMW0ejpdrmotykdghT06RkutCNKi/KUqeydvyKdPoucAlX8UDItd0e
         YmHA==
X-Forwarded-Encrypted: i=1; AJvYcCW3C5RRNKAsBPVf82W/vBOFOSmacf0wMgqacp9nl8O2ku52e5QXHpEG6r0EM+JOjnb8e5Z1QeV9eAXa@vger.kernel.org, AJvYcCW6+Ibfw2zJ1OIXd0QPUCW4Ic8j2U1oUlbkrZ7gb6k+kMw3VfKexauI4sb5WnZ4Xq1wSMHNHHdLb0TAZ60=@vger.kernel.org, AJvYcCXQi9mn/5dQM1npIVxNlAtA6YvTJY6euygwlETcxjTRDJW+Oq2jIKyuzr3n3C9h7tnUXY+1Pr/IRCE6BEBv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/omAS3rexBqg63TJBxckjY/Aj9gbUY6A3jVsTGGr6CnSna/bN
	/qnltX5E1dpsT9MqMjvCSVASmbBVkNtxhbOywToXRwscKB0Ai7QQXwTjibftWW2LV+wQNAsooPt
	KiF8RcSImhfnq+08LZEd4gl1uuRU=
X-Gm-Gg: ASbGncvMCQ6fH9tKyOXq4Sa33ugLiZru3EA9nVPG+v1XnE/zdY+VNB5L/oQ9/FJaTxb
	L59AF37LZEMwihHZ/6+uaXzEW2bRnwMJ15ee5SX3PRU7rLxzNu5SJ
X-Google-Smtp-Source: AGHT+IGuYLLLiMQ+T3DND27BIqyzCkGcL/yy72RPx3Z7PVSgyAnZgMNfVyiRsPwad3rQzFGNOdTY8wCncjrk2YYW6M8=
X-Received: by 2002:a05:6870:2a44:b0:29e:766d:e969 with SMTP id
 586e51a60fabf-2b1c0a19d1fmr4707483fac.10.1737235461997; Sat, 18 Jan 2025
 13:24:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com> <20241219170800.2957-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20241219170800.2957-2-jason-jh.lin@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 18 Jan 2025 15:24:10 -0600
X-Gm-Features: AbW1kvbUcK9BvfsO2Sd-qef90skIIlC9M3QrcorSc0sE_LN5G9Z9rfdnqxifwao
Message-ID: <CABb+yY2t7rBnoBEf3Pog0eRW_zvb0YggbgKBspnZOS1bsyQBPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Thu, Dec 19, 2024 at 11:08=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> 1. Add compatible name and iommus property to mediatek,gce-mailbox.yaml
>    for MT8196.
>
>    - The compatible name "mediatek,mt8196-gce-mailbox" is added to
>      ensure that the device tree can correctly identify and configure
>      the GCE mailbox for the MT8196 SoC.
>
>    - The iommus property is added to specify the IOMMU configuration
>      for the GCE mailbox, ensuring proper memory management and access
>      control.
>
> 2. Add the Global Command Engine (GCE) binding header to define the
>    abstrct symbol binding to the GCE hardware settings of GCE Thread
>    Priority, GCE Subsys ID and GCE Event for MT8196.
>
>    - GCE Thread Priority: Defined to configure the priority level for
>      each GCE hardware thread. This is necessary for proper scheduling
>      and execution of commands in the GCE.
>
>    - GCE Subsys ID: Defined to specify the subsystem ID for GCE clients.
>      This is used to correctly address and access different subsystems
>      within the GCE.
>
>    - GCE Event: Defined to specify the events that the GCE can handle.
>      These events are used by the driver to synchronize and manage
>      hardware operations.
>
>    Examples of the binding usage in the driver code:
>    1) GCE Thread Priority:
>    - Defined in the header file: `#define CMDQ_THR_PRIO_4 4`
>    - Used in the Device Tree: `mboxes =3D <&gce0 0 CMDQ_THR_PRIO_4>;`
>    - Parsed and used in the driver to set thread priority:
>      ```c
>      static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,i
>                                          const struct of_phandle_args *sp=
)
>      {
>         thread->priority =3D sp->args[1];
>      }
>      // set GCE thread priority to the priority level 4 for GCE thread 0
>      writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
>      ```
>
>    2) GCE Subsys ID:
>    - Defined in the header file: `#define SUBSYS_1c00XXXX 3`
>    - Used in the Device Tree:
>         `mediatek,gce-client-reg =3D <&gce SUBSYS_1c00XXXX 0x0000 0x1000>=
;`
>    - Parsed and used in the driver to configure subsys ID:
>      ```c
>      int cmdq_dev_get_client_reg(struct device *dev,
>                                  struct cmdq_client_reg *client_reg,
>                                  int idx)
>      {
>         client_reg->subsys =3D (u8)spec.args[0];
>         client_reg->offset =3D (u16)spec.args[1];
>      }
>      // GCE write the value to the register 0x1c000000 + 0x0000 + offset
>      cmdq_pkt_write(cmdq_handle, client_reg->subsys,
>                     client_reg->offset + offset, value);
>      ```
>
>    3) GCE Event:
>    - Defined in the header file:
>         `#define CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0 574`
>    - Used in the Device Tree:
>         `mediatek,gce-events =3D <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>;`
>    - Parsed and used in the driver to handle events:
>      ```c
>      int mtk_crtc_create(struct drm_device *drm_dev,
>                          const unsigned int *path,
>                          unsigned int path_len, int priv_data_index,
>                          const struct mtk_drm_route *conn_routes,
>                          unsigned int num_conn_routes)
>      {
>         of_property_read_u32_index(priv->mutex_node,
>                                    "mediatek,gce-events", i,
>                                    &mtk_crtc->cmdq_event);
>      }
>      // GCE clear the STREAM_DONE event sent from DISP_MUTEX hardware
>      cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
>      ```
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../mailbox/mediatek,gce-mailbox.yaml         |    4 +
>  .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1415 +++++++++++++++++
>  2 files changed, 1419 insertions(+)
>  create mode 100644 include/dt-bindings/mailbox/mediatek,mt8196-gce.h
>
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index cef9d7601398..73d6db34d64a 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -25,6 +25,7 @@ properties:
>            - mediatek,mt8188-gce
>            - mediatek,mt8192-gce
>            - mediatek,mt8195-gce
> +          - mediatek,mt8196-gce
>        - items:
>            - const: mediatek,mt6795-gce
>            - const: mediatek,mt8173-gce
> @@ -49,6 +50,9 @@ properties:
>      items:
>        - const: gce
>
> +  iommus:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - "#mbox-cells"
> diff --git a/include/dt-bindings/mailbox/mediatek,mt8196-gce.h b/include/=
dt-bindings/mailbox/mediatek,mt8196-gce.h
> new file mode 100644
> index 000000000000..9e0700236033
> --- /dev/null
> +++ b/include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> @@ -0,0 +1,1415 @@

1415 ?  90% seem unnecessary.

> +
> +/* GCE thread priority */
> +#define CMDQ_THR_PRIO_LOWEST   0
> +#define CMDQ_THR_PRIO_1                1
> +#define CMDQ_THR_PRIO_2                2
> +#define CMDQ_THR_PRIO_3                3
> +#define CMDQ_THR_PRIO_4                4
> +#define CMDQ_THR_PRIO_5                5
> +#define CMDQ_THR_PRIO_6                6
> +#define CMDQ_THR_PRIO_HIGHEST  7
>
 Only need to HIGHEST maybe


> +
> +/* GCE subsys table */
> +#define SUBSYS_1300XXXX                0
> +#define SUBSYS_1400XXXX                1
> +#define SUBSYS_1401XXXX                2
> +#define SUBSYS_1402XXXX                3
> +#define SUBSYS_1502XXXX                4
> +#define SUBSYS_1880XXXX                5
> +#define SUBSYS_1881XXXX                6
> +#define SUBSYS_1882XXXX                7
> +#define SUBSYS_1883XXXX                8
> +#define SUBSYS_1884XXXX                9
> +#define SUBSYS_1000XXXX                10
> +#define SUBSYS_1001XXXX                11
> +#define SUBSYS_1002XXXX                12
> +#define SUBSYS_1003XXXX                13
> +#define SUBSYS_1004XXXX                14
> +#define SUBSYS_1005XXXX                15
> +#define SUBSYS_1020XXXX                16
> +#define SUBSYS_1028XXXX                17
> +#define SUBSYS_1700XXXX                18
> +#define SUBSYS_1701XXXX                19
> +#define SUBSYS_1702XXXX                20
> +#define SUBSYS_1703XXXX                21
> +#define SUBSYS_1800XXXX                22
> +#define SUBSYS_1801XXXX                23
> +#define SUBSYS_1802XXXX                24
> +#define SUBSYS_1804XXXX                25
> +#define SUBSYS_1805XXXX                26
> +#define SUBSYS_1808XXXX                27
> +#define SUBSYS_180aXXXX                28
> +#define SUBSYS_180bXXXX                29
> +#define SUBSYS_NO_SUPPORT      99
> +
Keep only that you use now or plan in  the near future. But ok.

> +/* GCE-D hardware events */
> +#define CMDQ_EVENT_DISP0_STREAM_SOF0                                    =
       0
> +#define CMDQ_EVENT_DISP0_STREAM_SOF1                                    =
       1
> +#define CMDQ_EVENT_DISP0_STREAM_SOF2                                    =
       2
> +#define CMDQ_EVENT_DISP0_STREAM_SOF3                                    =
       3
> +#define CMDQ_EVENT_DISP0_STREAM_SOF4                                    =
       4
> +#define CMDQ_EVENT_DISP0_STREAM_SOF5                                    =
       5
> +#define CMDQ_EVENT_DISP0_STREAM_SOF6                                    =
       6
> +#define CMDQ_EVENT_DISP0_STREAM_SOF7                                    =
       7
> +#define CMDQ_EVENT_DISP0_STREAM_SOF8                                    =
       8
> +#define CMDQ_EVENT_DISP0_STREAM_SOF9                                    =
       9
> +#define CMDQ_EVENT_DISP0_STREAM_SOF10                                   =
       10
> +#define CMDQ_EVENT_DISP0_STREAM_SOF11                                   =
       11
> +#define CMDQ_EVENT_DISP0_STREAM_SOF12                                   =
       12
> +#define CMDQ_EVENT_DISP0_STREAM_SOF13                                   =
       13
> +#define CMDQ_EVENT_DISP0_STREAM_SOF14                                   =
       14
> +#define CMDQ_EVENT_DISP0_STREAM_SOF15                                   =
       15
>
 you mean
  #define CMDQ_EVENT_DISP0_STREAM_SOF(n)  n

> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL0                                =
       16
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL1                                =
       17
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL2                                =
       18
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL3                                =
       19
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL4                                =
       20
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL5                                =
       21
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL6                                =
       22
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL7                                =
       23
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL8                                =
       24
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL9                                =
       25
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL10                               =
       26
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL11                               =
       27
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL12                               =
       28
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL13                               =
       29
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL14                               =
       30
> +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL15                               =
       31

   #define CMDQ_EVENT_DISP0_FRAME_DONE_SEL(n)
            (16 + n)


> +#define CMDQ_EVENT_DISP0_DISP_WDMA0_TARGET_LINE_END_ENG_EVENT           =
       32
> +#define CMDQ_EVENT_DISP0_DISP_WDMA0_SW_RST_DONE_ENG_EVENT               =
       33
> +#define CMDQ_EVENT_DISP0_DISP_POSTMASK1_RST_DONE_ENG_EVENT              =
       34
> +#define CMDQ_EVENT_DISP0_DISP_POSTMASK0_RST_DONE_ENG_EVENT              =
       35
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_TIMEOUT_ENG_EVENT                  =
       36
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT0              =
       37
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT1              =
       38
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT2              =
       39
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT3              =
       40
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT4              =
       41
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT5              =
       42
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT6              =
       43
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT7              =
       44
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT8              =
       45
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT9              =
       46
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT10             =
       47
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT11             =
       48
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT12             =
       49
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT13             =
       50
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT14             =
       51
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT15             =
       52
> +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_GET_RELEASE_ENG_EVENT              =
       53
> +#define CMDQ_EVENT_DISP0_DISP_MDP_RDMA0_SW_RST_DONE_ENG_EVENT           =
       54
> +
 keep only the used ones and use

> +#define CMDQ_EVENT_DISP1_STREAM_SOF0                                    =
       55
> +#define CMDQ_EVENT_DISP1_STREAM_SOF1                                    =
       56
> +#define CMDQ_EVENT_DISP1_STREAM_SOF2                                    =
       57
> +#define CMDQ_EVENT_DISP1_STREAM_SOF3                                    =
       58
> +#define CMDQ_EVENT_DISP1_STREAM_SOF4                                    =
       59
> +#define CMDQ_EVENT_DISP1_STREAM_SOF5                                    =
       60
> +#define CMDQ_EVENT_DISP1_STREAM_SOF6                                    =
       61
> +#define CMDQ_EVENT_DISP1_STREAM_SOF7                                    =
       62
> +#define CMDQ_EVENT_DISP1_STREAM_SOF8                                    =
       63
> +#define CMDQ_EVENT_DISP1_STREAM_SOF9                                    =
       64
> +#define CMDQ_EVENT_DISP1_STREAM_SOF10                                   =
       65
> +#define CMDQ_EVENT_DISP1_STREAM_SOF11                                   =
       66
> +#define CMDQ_EVENT_DISP1_STREAM_SOF12                                   =
       67
> +#define CMDQ_EVENT_DISP1_STREAM_SOF13                                   =
       68
> +#define CMDQ_EVENT_DISP1_STREAM_SOF14                                   =
       69
> +#define CMDQ_EVENT_DISP1_STREAM_SOF15                                   =
       70
>
   (55 + n)

> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL0                                =
       71
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL1                                =
       72
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL2                                =
       73
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL3                                =
       74
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL4                                =
       75
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL5                                =
       76
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL6                                =
       77
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL7                                =
       78
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL8                                =
       79
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL9                                =
       80
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL10                               =
       81
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL11                               =
       82
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL12                               =
       83
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL13                               =
       84
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL14                               =
       85
> +#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL15                               =
       86
>
   (71  + n)

> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0                         =
               87
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1                         =
               88
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT2                         =
               89
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT3                         =
               90
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT4                         =
               91
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT5                         =
               92
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT6                         =
               93
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT7                         =
               94
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT8                         =
               95
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT9                         =
               96
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT10                        =
       97
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT11                        =
       98
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT12                        =
       99
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT13                        =
       100
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT14                        =
       101
> +#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT15                        =
       102
>
  (87 + n)

> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT0                     =
       103
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT1                     =
       104
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT2                     =
       105
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT3                     =
       106
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT4                     =
       107
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT5                     =
       108
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT6                     =
       109
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT7                     =
       110
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT8                     =
       111
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT9                     =
       112
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT10                    =
       113
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT11                    =
       114
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT12                    =
       115
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT13                    =
       116
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT14                    =
       117
> +#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT15                    =
       118
>
  you know

> +#define CMDQ_EVENT_DISP1_OCIP_SUBSYS_SRAM_ISOINT_ENG_EVENT              =
       119
> +#define CMDQ_EVENT_DISP1_DISP_WDMA4_TARGET_LINE_END_ENG_EVENT           =
       120
> +#define CMDQ_EVENT_DISP1_DISP_WDMA4_SW_RST_DONE_ENG_EVENT               =
       121
> +#define CMDQ_EVENT_DISP1_DISP_WDMA3_TARGET_LINE_END_ENG_EVENT           =
       122
> +#define CMDQ_EVENT_DISP1_DISP_WDMA3_SW_RST_DONE_ENG_EVENT               =
       123
> +#define CMDQ_EVENT_DISP1_DISP_WDMA2_TARGET_LINE_END_ENG_EVENT           =
       124
> +#define CMDQ_EVENT_DISP1_DISP_WDMA2_SW_RST_DONE_ENG_EVENT               =
       125
> +#define CMDQ_EVENT_DISP1_DISP_WDMA1_TARGET_LINE_END_ENG_EVENT           =
       126
> +#define CMDQ_EVENT_DISP1_DISP_WDMA1_SW_RST_DONE_ENG_EVENT               =
       127
> +#define CMDQ_EVENT_DISP1_DISP_MUTEX0_TIMEOUT_ENG_EVENT                  =
       128
> +#define CMDQ_EVENT_DISP1_DISP_MUTEX0_GET_RLZ_ENG_EVENT                  =
       129
> +#define CMDQ_EVENT_DISP1_DISP_MDP_RDMA1_SW_RST_DONE_ENG_EVENT           =
       130
> +#define CMDQ_EVENT_DISP1_DISP_GDMA0_SW_RST_DONE_ENG_EVENT               =
       131
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VSYNC_START_ENG_EVENT     =
       132
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VSYNC_END_ENG_EVENT       =
       133
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VRR_VFP_LAST_SAFE_BLANK_EN=
G_EVENT        134
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VFP_START_ENG_EVENT       =
       135
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VFP_LAST_LINE_ENG_EVENT   =
       136
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VDE_END_ENG_EVENT         =
               137
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_TRIGGER_LOOP_CLR_ENG_EVENT=
       138
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_TARGET_LINE1_ENG_EVENT    =
       139
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_TARGET_LINE0_ENG_EVENT    =
       140
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_EXT_TG_VSYNC_START_ENG_EVENT     =
       141
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_EXT_TG_VSYNC_END_ENG_EVENT       =
       142
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_EXT_TG_VDE_START_ENG_EVENT       =
       143
> +#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_EXT_TG_VDE_END_ENG_EVENT         =
               144
>
  keep only the used ones

> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT0                           =
       145
> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT1                           =
       146
> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT2                           =
       147
> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT3                           =
       148
> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT4                           =
       149
> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT5                           =
       150
> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT6                           =
       151
> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT7                           =
       152
> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT8                           =
       153
> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT9                           =
       154
> +#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT10                          =
       155
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT0                           =
       156
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT1                           =
       157
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT2                           =
       158
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT3                           =
       159
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT4                           =
       160
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT5                           =
       161
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT6                           =
       162
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT7                           =
       163
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT8                           =
       164
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT9                           =
       165
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT10                          =
       166
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT11                          =
       167
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT12                          =
       168
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT13                          =
       169
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT14                          =
       170
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT15                          =
       171
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT16                          =
       172
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT17                          =
       173
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT18                          =
       174
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT19                          =
       175
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT20                          =
       176
> +#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT21                          =
       177
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT0                           =
       178
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT1                           =
       179
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT2                           =
       180
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT3                           =
       181
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT4                           =
       182
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT5                           =
       183
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT6                           =
       184
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT7                           =
       185
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT8                           =
       186
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT9                           =
       187
> +#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT10                          =
       188
>

DSI2_ENG_EVENT(n)   (145 + n)
DSI1_ENG_EVENT(n)   (156 + n)
DSI0_ENG_EVENT(n)   (178 + n)

I am not going through the math exercises below but I believe you get the i=
dea.

thanks

