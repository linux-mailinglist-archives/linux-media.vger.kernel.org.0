Return-Path: <linux-media+bounces-20702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3189B9465
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 16:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E59A1F21B52
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 15:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A751C68A6;
	Fri,  1 Nov 2024 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3SagI3t1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6EA1A3031
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730474856; cv=none; b=Pr7VsF01fpQG3q6Fp2K1AX1p/cuU8fNYzVBWu6/31Oytyv0kSIukktB+hoQ9Tjd5awUWjHdtakDww0HL8GcHEoTx7mAxk8feeHE8ilPMfwgaG/6xBIyy+C1fVaXve0/dXhY+LTxQ+Vrd7qZGkks8DbORgdVykXB3XQMEY8gaW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730474856; c=relaxed/simple;
	bh=v6bPRfzSENICoKf9OISSZbMLHA1bYo0mcGwtUDZpoK8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pnC3mwL9pWj6DTbVpQVQxYFoL8woy9ePSMpm/lkR6DAT6Q2ECxWTYJTror90nLRsZnthe9Nwvo+uQyHZEq6LdiHteC8gd5kpDMOAn0ql27XAu+5IEkRJRU+u1ZQQijB/uBN8pLvsO44bP3dmeWlaUNaMP62ZGuU3PX1bewbaT6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3SagI3t1; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cec7c058f8so205115a12.1
        for <linux-media@vger.kernel.org>; Fri, 01 Nov 2024 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1730474851; x=1731079651; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6TkXEo4x1I5Rzwt8fjqhUP2t7jAOO31BIJtURlqSmc=;
        b=3SagI3t1U8CH99DmXDvZmkGIbbxKeCjM9vLWKrwep4eNtJH8xc48NrzDbhtMSFPqY5
         bfafTDTEgEuGQVgICE9QAJfYJDGPnS+vCFT4n7RLMTYYgbXFUAGCPj2REl3JccXGtNS+
         9EjDsg08WCZB3fmetfifqWBpDlKfJTYz81m6x2wQNc6V6S08DSTr8mY0QH/XXsqeR4Tt
         EeomETE1N7CCrBTYiqQXvTNCgTUy3cSHCawm+RPt+e6yTt6cDRDi5vBkve11eA5UzOp6
         1IqC6UjrMUh8eivk0XvR+5YGcyCNMDiTwg0NBu9QHt8ny6SpE6vzgtDloW3aXnj2on5O
         jf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730474851; x=1731079651;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K6TkXEo4x1I5Rzwt8fjqhUP2t7jAOO31BIJtURlqSmc=;
        b=E3OXqowUDsnSWF4WzVId8+V/SqJ/FbJk7ufnN6+SoSeF4vlnWTNg/9uSnzAA6ADjUL
         lmWan+cjT3fbOuId/Wi5R3s8YK+KYsoORejZWE6+6dX3SjyOxsmjWMggd+KXJkILAL+X
         FdMKbj93tUcoPYO7dzQrAOKkLVYxsCecCzW00G8uquNUCA4njL/PhUFbtkV5EU++lkzF
         ibgyDHpC7HJN5Iioj8PUR/X4v1CoZnuUXvIS5fleYZ1f1J+L5EIL+JS5iaM32dcHGGfE
         gr6PxOAfkpfEQ6IgzKgpxHvxOAEOprvzN0yGcfvtv3sLUSFDAZ+UTBED+djf3gZnsOYM
         Qacw==
X-Forwarded-Encrypted: i=1; AJvYcCUPdi2eWg25Vbtn1Am8BHASbo/TPoO367V19osW//oBrXS0RXjqekS20ZpEiDUi2nRFNFmWUTQSJ8Hlkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaDigZZrz7ZMuC7qpXyJkEopnFMArkT4fn0qyqYo3nIev56Wm4
	qSkNDIaoBm3uZC1WsoQxRB/TeWCSihuKLXL1RkBV5BbyI1uJoNawvnbgOs9oS5E=
X-Google-Smtp-Source: AGHT+IHBNPcncBQHtNtb7STpigHQlaFGA7NJY+pQaXbjyeqQZ6bXscULA7A1iluv+zMZo2STz3vLvw==
X-Received: by 2002:a05:6402:2695:b0:5c2:6d16:ad5e with SMTP id 4fb4d7f45d1cf-5ceb92a7bc4mr2823312a12.19.1730474851261;
        Fri, 01 Nov 2024 08:27:31 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac5cb8fbsm1607974a12.0.2024.11.01.08.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 08:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Nov 2024 16:27:30 +0100
Message-Id: <D5AY4ZK858IO.3BH1USXK7NTAD@fairphone.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
Subject: Re: [PATCH v4 0/6] media: qcom: camss: Add sc7280 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikram Sharma" <quic_vikramsa@quicinc.com>, <rfoss@kernel.org>,
 <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <akapatra@quicinc.com>, <hariramp@quicinc.com>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
 <will@kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
In-Reply-To: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>

On Wed Oct 30, 2024 at 11:53 AM CET, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY=
,
> CSID, VFE/RDI interfaces in SC7280.
>
> SC7280 provides
>
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
>
> The changes are verified on SC7280 qcs6490-rb3gen2 board, with attached v=
ision mezzanine
> the base dts for qcs6490-rb3gen2 is:
> https://lore.kernel.org/all/20231103184655.23555-1-quic_kbajaj@quicinc.co=
m/

Hi Vikram!

Two things:

You use the property "power-domains-names" in both bindings and dtsi but
this property is never parsed in the kernel. This should be
"power-domain-names"

Second, I still can't get the test pattern to work on my QCM6490-based
phone (Fairphone 5). Could you please try if the commands as per [0]
work on your board?

[0] https://lore.kernel.org/linux-arm-msm/c912f2da-519c-4bdc-a5cb-e19c3aa63=
ea8@linaro.org/

Regards
Luca

>
> Changes in V4:
> - V3 had 8 patches and V4 is reduced to 6.
> - Removed [Patch v3 2/8] as binding change is not required for dtso.
> - Removed [Patch v3 3/8] as the fix is already taken care in latest
>   kernel tip.=20
> - Updated alignment for dtsi and dt-bindings.
> - Adding qcs6490-rb3gen2-vision-mezzanine as overlay.=20
> - Link to v3: https://lore.kernel.org/linux-arm-msm/20241011140932.174412=
4-1-quic_vikramsa@quicinc.com/
>
> Changes in V3:
> - Added missed subject line for cover letter of V2.
> - Updated Alignment, indentation and properties order.
> - edit commit text for [PATCH 02/10] and [PATCH 03/10].
> - Refactor camss_link_entities.
> - Removed camcc enablement changes as it already done.
> - Link to v2: https://lore.kernel.org/linux-arm-msm/20240904-camss_on_sc7=
280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com/
>
> Changes in V2:
> - Improved indentation/formatting.
> - Removed _src clocks and misleading code comments.
> - Added name fields for power domains and csid register offset in DTSI.
> - Dropped minItems field from YAML file.
> - Listed changes in alphabetical order.
> - Updated description and commit text to reflect changes
> - Changed the compatible string from imx412 to imx577.
> - Added board-specific enablement changes in the newly created vision
>   board DTSI file.
> - Fixed bug encountered during testing.
> - Moved logically independent changes to a new/seprate patch.
> - Removed cci0 as no sensor is on this port and MCLK2, which was a
>   copy-paste error from the RB5 board reference.
> - Added power rails, referencing the RB5 board.
> - Discarded Patch 5/6 completely (not required).
> - Removed unused enums.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20240629-camss_first_=
post_linux_next-v1-0-bc798edabc3a@quicinc.com/
>
> Suresh Vankadara (1):
>   media: qcom: camss: Add support for camss driver on SC7280
>
> Vikram Sharma (5):
>   media: dt-bindings: media: camss: Add qcom,sc7280-camss binding
>   media: qcom: camss: Sort CAMSS version enums and compatible strings
>   media: qcom: camss: Restructure camss_link_entities
>   arm64: dts: qcom: sc7280: Add support for camss
>   arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision
>     mezzanine
>
>  .../bindings/media/qcom,sc7280-camss.yaml     | 439 +++++++++++++++
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  73 +++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          | 208 ++++++++
>  .../media/platform/qcom/camss/camss-csid.c    |   1 -
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         |  13 +-
>  .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
>  .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
>  drivers/media/platform/qcom/camss/camss-vfe.c |   8 +-
>  drivers/media/platform/qcom/camss/camss.c     | 500 ++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss.h     |   1 +
>  11 files changed, 1190 insertions(+), 63 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-c=
amss.yaml
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezza=
nine.dtso


