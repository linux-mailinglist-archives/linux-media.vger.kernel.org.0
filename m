Return-Path: <linux-media+bounces-8306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5B1893C88
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 17:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEFC71F225D2
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 15:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802AA4597C;
	Mon,  1 Apr 2024 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFE/cmz3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7A64501C;
	Mon,  1 Apr 2024 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711983810; cv=none; b=UeE8JK2zfCzJW25JN/Yt1HtUD5cqYhtvCbn7XspG4Cjrl2+6GSJEp+5A1XmpPOwoZuPnYw8heHgqbMDrm5Dz03DXJhn5fzzMpwIS46fDJ4BiqB6ZJsMdynOlv/5uoMY9XR0FeXfZ2tV7rDRt3xqYgQqgpUaI/dJDkB3VwQmiSMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711983810; c=relaxed/simple;
	bh=0BjhkJZo1GGrBFIuI2O8IflDs/9gbR3k2FcSw6QU9G8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvu+1a44/oN0RRKrVn40kUSvJUoiaaoQKsG6tEuye7rD+NKNpMBrqvuGTAVeGXGOAEzwnLVxRKgaFLcVMbrktEtmG+gxIzKTcdXI4YNKWOddXbp8JIyT/4R+dVtJ5601mZvIjlGzg+89vqv83GA3btq4mkGUbndfH0cb/L0Rcf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFE/cmz3; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2a1f8308532so1068304a91.1;
        Mon, 01 Apr 2024 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711983808; x=1712588608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ze4P2kj5+cKm0E+fPR6OILfVwR9k2qDZCBLpSr+WBq8=;
        b=QFE/cmz32ZPBaCFzkVz/uon1jizSw7ECHq2ii6Glg5z6JjsPvBgJzSVr3CGMPbznH4
         Il1APpDRxYmJEEcsXsmLkEoD/8ZihmAFrbCojg4uTlsx4nbkyUpqBfOGIzQR/b1q2+HG
         t+Dk2gQZ/shpziZ0q90ednti4pH+iqxMgHfXtOvw3FSNwVklwvhRtolLVvehK2DW+53c
         taUHiOXjd4YplKl7HNSgS2Fc2j9fVKtN1iI4Cimk8BM+a1YYbylupbRd9PUaPBCo67CE
         +tluZAcQN8rMuTFOFm8twvTa1+95gm10H/bgeFAg6NpQga0En0kSlbwD4HD/ZKyK9Tgr
         htQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711983808; x=1712588608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ze4P2kj5+cKm0E+fPR6OILfVwR9k2qDZCBLpSr+WBq8=;
        b=FhaBtJt8C4crK5XMkGuq/Z4AxMid6rTP6/EuCTrp0MvfXtgQlleChdonN6f1i7mRfs
         556QC7x/pYt7tj1NogXnRbTVMlUQmhS0/7CfUMiooGTRusm92Io5HrQYZpexPxXVOPVb
         cX/2n93Q2kNS3qFThzRw2MnPnSm2mJnjZDm6UxnNVHaiAsmROYf9q7IJ68R5Ug/gVl8i
         hy53IfJAEv3WABtLneGAsqOT8E1iqOc5cgo8Et0wH6XS5UNSj1/JEFFQYE5z1nO0b53v
         TpOkyHNZJtt9lu/4Y5lERpfo8enL0jNKo7uys0tjDFngg9BqdXT/jU8mxQL+DKUpURvM
         Je7w==
X-Forwarded-Encrypted: i=1; AJvYcCVrZzig2rI3UR6zq0h+/+9zxArnKPc2Q8l4VJNbZHQjpqN/YhCCUir8L70OXTva9T+rEa5jXcJR2pZl53RlOgN7DnziwNYs9U255IohJl0GKIGFJhrxm9JxHiV+t9pQt+hH9M+QvX6g
X-Gm-Message-State: AOJu0YyfYBmtJvKIlZWSTC8I+B89PEI4MgSCLb/+ij55ifAKuI9FB7Zw
	Cb5ZPTtxirkuvtDXmFKuutrCwWGeSLAiiy5RT6r5xda1w7yoaMJB+8JglndTrJ0Pwi4ELPAF/qI
	XNm/5jWBink4XkhGK8dWkbtmsMUaoNVM3aQI=
X-Google-Smtp-Source: AGHT+IEhAYLQ64iN3FASx25YizKuW8GqC49Qof31l7E8u7oVmoRIQRr8smI5IT7tmr72GpPyC+U1wQcxISRNzGtJngk=
X-Received: by 2002:a17:90a:688d:b0:2a0:2605:69be with SMTP id
 a13-20020a17090a688d00b002a0260569bemr9866428pjd.2.1711983808058; Mon, 01 Apr
 2024 08:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326231033.2048193-1-festevam@gmail.com> <ZgPtolH796HER4cP@kekkonen.localdomain>
 <CAOMZO5AYjNPWZfy_dN12K9JNwWaWThpMs0W-FzETF5k8fobgeg@mail.gmail.com> <ZgSeACFfBAmOPXdt@kekkonen.localdomain>
In-Reply-To: <ZgSeACFfBAmOPXdt@kekkonen.localdomain>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 1 Apr 2024 12:03:15 -0300
Message-ID: <CAOMZO5BGYhnhOrBRS9zBeYYJFHXnQkqZCAV2wGtdpmiA3HZTqA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: ovti,ov2680: Document clock/data-lanes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: rmfrfs@gmail.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed, Mar 27, 2024 at 7:30=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> > In this case, the correct fix would be to remove 'clock-lanes' and
> > 'data-lanes' from imx7s-warp.dts.
>
> Agreed.

I tried removing 'clock-lanes' and  'data-lanes', but it did not work:

ov2680 1-0036: error -EINVAL: only a 1-lane CSI2 config is supported
ov2680 1-0036: probe with driver ov2680 failed with error -22

I will send a v2 that documents 'clock-lanes', 'data-lanes', and
'link-frequencies'.

