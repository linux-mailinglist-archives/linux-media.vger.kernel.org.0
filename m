Return-Path: <linux-media+bounces-3958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5148359DA
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 04:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E9A4B211E7
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 03:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC921C33;
	Mon, 22 Jan 2024 03:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CRF/mFIH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2994C6D
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 03:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705895130; cv=none; b=NS90bdyDREn8h1VWOtxrQsNpXwMDL63O218AA0bjPhdE/MBu+fCDh9zGipImEdl5kPD/jeb0UDBjDASCSN4Y9E3xLKJOJyRkYmPydiG7X0Gk2rq+K9rtoq8ZKhx6WAn+JMLYu1JPXK0Tkzrt1hl5Z1NkUNwvHj8+2XXJeiFmdAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705895130; c=relaxed/simple;
	bh=eUc28hxFSOjAp6vDpl8grw083rrwKd7v+61OGCuTiAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOSwLmqa5Qh7AvXqZlQLNfBHQjCgE9Ham9PUzZtl2jBPY2a2QqECsTTclLh/BxBGwDfkrfUZr2tFzYxUtWHFldwfWOfvR7zm5ZV8O9VOJ2sBPcjKLK3SmyMdq5pkC8Y/5lw/zZs5H1++CnJjkwRyNU2TwVrtSfyvWIp15pxApTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CRF/mFIH; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-49618e09f16so418940e0c.2
        for <linux-media@vger.kernel.org>; Sun, 21 Jan 2024 19:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705895128; x=1706499928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE8ms7ryFZW9Ht/e6NRcvd7QnzuOU18cg/pk9kEcOj4=;
        b=CRF/mFIHn0kioGg+daZMGNnlkdnmaV+XpseK/om4YD4KAPx7wxouJ3iwQm1XrhPStI
         4PclLukdUsWyzHl5IWPpwd6Zg4zzEBeMrysmrwUDFPALlVXoHcwa7K624lkCsGvDrdNt
         uhO63/bAYYtPoQQLwlGVI9Aswb+CwntC7w7b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705895128; x=1706499928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kE8ms7ryFZW9Ht/e6NRcvd7QnzuOU18cg/pk9kEcOj4=;
        b=Qh4C6QFB9VgKv9l9oRyWq8hpSz4pP2+PJbAIMJQTpB07LtL46PiaFC6wvtIMjlFXxs
         tvBvVf+NTNSEWFtaDGXnI63OjxNrftk4yJ7rOvC8jHBkiCQHemxDH1FGMkBcPdyBvcwb
         gJh2eiKzVwZcklai8w5J41OZYzhoSY5tmufY8aXNo27jlPE2wpr396SCX9doVohARCRH
         S10uxRo8LIDcrQc1vkbbna4+8oeUDSkkuTgKF8bg/q83eAbUpkjvE9QLdjVkywzgvDJt
         8/ePSR7kY+b8FHa/rSZlSwweU9mOGAGaHV4Dv0dDDTs3E/ewxyeAVzEP4GopaZgKxBoM
         zM1Q==
X-Gm-Message-State: AOJu0Yy45JQiINN7oprrt9OJc+wXVasx+w0g1d7ug5KHnW1WniQ7QcVF
	AzNL4XLx+xHJgyWvMSvntrcvrKM0QK3huzU8mGxe0Doo3MDXRtIo52kgPPdh1P0YO3HmAZTSZN5
	TKA==
X-Google-Smtp-Source: AGHT+IH2pRllJ/RtxJCoKhtYthgcrPWHWlbQPE7NEhcrb23T/OmH+Gg2KBwHNjDiUywiHuwEfwldbA==
X-Received: by 2002:a05:6102:3a53:b0:469:b884:577d with SMTP id c19-20020a0561023a5300b00469b884577dmr243616vsu.4.1705895128058;
        Sun, 21 Jan 2024 19:45:28 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id p9-20020a9f3689000000b007ce2052a246sm953774uap.33.2024.01.21.19.45.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 19:45:27 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4b9302191a2so403276e0c.1
        for <linux-media@vger.kernel.org>; Sun, 21 Jan 2024 19:45:26 -0800 (PST)
X-Received: by 2002:a05:6122:410b:b0:4b7:1658:e66b with SMTP id
 ce11-20020a056122410b00b004b71658e66bmr994565vkb.23.1705895125827; Sun, 21
 Jan 2024 19:45:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com> <20240119063224.29671-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20240119063224.29671-2-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 22 Jan 2024 11:44:48 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng5v5-LSq6d-R-89N35qiKd7qa8FEo6qakWxrzibYvgSQ@mail.gmail.com>
Message-ID: <CAC=S1ng5v5-LSq6d-R-89N35qiKd7qa8FEo6qakWxrzibYvgSQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 2:32=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
Hi Jason,

Just few nitpicks about typo:
>
> Add mediatek,gce-props.yaml for common GCE properties that is used for
> both mailbox providers and consumers. We place the common property
> "mediatek,gce-events" in this binding currently.
>
> The property "mediatek,gce-events" is used for GCE event ID corresponding
> to a hardware event signal sent by the hardware or a sofware driver.
software

> If the mailbox providers or consumers want to manipulate the value of
> the event ID, they need to know the specific event ID.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gc=
e-props.yaml
>
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props=
.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> new file mode 100644
> index 000000000000..68b519ff089f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Global Command Engine Common Propertes
Properties

> +
> +maintainers:
> +  - Houlong Wei <houlong.wei@mediatek.com>
> +
> +description:
> +  The Global Command Engine (GCE) is an instruction based, multi-threade=
d,
> +  single-core command dispatcher for MediaTek hardware. The Command Queu=
e
> +  (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
> +  mailbox framework. It is used to receive messages from mailbox consume=
rs
> +  and configure GCE to execute the specified instruction set in the mess=
age.
> +  We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mai=
lbox
> +  driver. A device driver that uses the CMDQ driver to configure its har=
dware
> +  registers is a mailbox consumer. The mailbox consumer can request a ma=
ilbox
> +  channel corresponding to a GCE hardware thread to send a message, spec=
ifying
> +  that the GCE thread to configure its hardware. The mailbox provider ca=
n also
> +  reserved a mailbox channel to configure GCE hardware register by the s=
pcific
s/reserved/reserve/
s/spcific/specific/

Regards,
Fei


> +  GCE thread. This binding defines the common GCE properties for both ma=
ilbox
> +  provider and consumers.
> +
> +properties:
> +  mediatek,gce-events:
> +    description:
> +      GCE has an event table in SRAM, consisting of 1024 event IDs (0~10=
23).
> +      Each event ID has a boolean event value with the default value 0.
> +      The property mediatek,gce-events is used to obtain the event IDs.
> +      Some gce-events are hardware-bound and cannot be changed by softwa=
re.
> +      For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX=
 will
> +      send an event signal to GCE, setting the value of event ID 597 to =
1.
> +      Similarly, in MT8188, the value of event ID 574 will be set to 1 w=
hen
> +      VOD0_MUTEX is stream done.
> +      On the other hand, some gce-events are not hardware-bound and can =
be
> +      changed by software. For example, in MT8188, we can set the value =
of
> +      event ID 855, which is not bound to any hardware, to 1 when the dr=
iver
> +      in the secure world completes a task. However, in MT8195, event ID=
 855
> +      is already bound to VDEC_LAT1, so we need to select another event =
ID to
> +      achieve the same purpose. This event ID can be any ID that is not =
bound
> +      to any hardware and is not yet used in any software driver.
> +      To determine if the event ID is bound to the hardware or used by a
> +      software driver, refer to the GCE header
> +      include/dt-bindings/gce/<chip>-gce.h of each chip.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 1024
> +
> +additionalProperties: true
> --
> 2.18.0
>
>

