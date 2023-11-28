Return-Path: <linux-media+bounces-1180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6BF7FAF10
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 01:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAEAC1C20DD0
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 00:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76AE1100;
	Tue, 28 Nov 2023 00:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuZY+rHR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62751A1;
	Mon, 27 Nov 2023 16:31:13 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6cb90b33c1dso1328895b3a.0;
        Mon, 27 Nov 2023 16:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701131473; x=1701736273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cpz4BQehxgx4d6E6VTxv2kZXG21+fKH0kKD3/XF/fnQ=;
        b=UuZY+rHR25s8akCdKACVyZrtPnMS5kpn0DMWY+ElyGK6QwQyPJ5t7nsJks6vAo6s/i
         QVjJi5dNT9ioJN6DDPP4K/VI6cKy/3Ym07+EcZzTRuuTF5eTOLeOIfMVMuIRMTHOeCML
         z4EwsUIEu0SHXN+RPtp+FfkBzRLAan4VBSgWx1V2ZaGySnyHZBDybX0rqc6zmmf7aX4F
         E93anhHxysYbdehRY2OyPd1IYUjtNHRHQ1K8i+UPLRm4BH6Gqdldr29Jlry7ywjGj0CY
         gbTfrrJSFoN/xtnjuhujJZyFvn72UHlK6fW0twOuMjpf0Oj0tWJ/8CwJZIYM4w7SrULn
         hvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701131473; x=1701736273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cpz4BQehxgx4d6E6VTxv2kZXG21+fKH0kKD3/XF/fnQ=;
        b=VpGyBsPzCuBzFboZ1o5V2MqA1cZzG28oAD3KsrW6m9uJ+knadv3XGagKvy5D9cikw5
         53u6Gc++lo2CrDrtj7rVT1jl1FAQrTNdMhCTteutiThy7nGp9TXtBrrnj0XCSQsc2W2n
         oLuWJ7jU0v3e4Ko6MR0CJAIpz+WzMDlDzWmthX2RQUAwIhdm5q3jO20RTpzhJaKFGL5G
         v2duqWSwiN2D/3JqqgO0X0DsHZN2iCN/K7IpZbLrjtOzvJEGKGsE8LhSfJjNLFUe1Dno
         cor/GlHKmxRE3lJOGVoEPfxkivHtBCPTO1ITtDTugFdK0ojX4+fuhm3q+t3WPA6r8wlE
         +AMw==
X-Gm-Message-State: AOJu0Yz9zgb4GlSu/2y5GhVrlGJFLvh4JED1ZHeMLmN6SG46pifupp+M
	YKkQOmZCVLkRJ5b/GN77o40Fkr9cuKWTCc+/lOI=
X-Google-Smtp-Source: AGHT+IE7YMoQTPGKWh1CLM/BboMK0oIReF03OoIrEeeF2s0d6kCk4epY8gmt6daBql5XO3mcSI2fJynte1WJJDE4/AI=
X-Received: by 2002:a05:6a20:7da6:b0:187:9486:901e with SMTP id
 v38-20020a056a207da600b001879486901emr16373770pzj.0.1701131473302; Mon, 27
 Nov 2023 16:31:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231126125320.4024456-1-festevam@gmail.com> <20231126125320.4024456-2-festevam@gmail.com>
 <20231128000033.GD25590@pendragon.ideasonboard.com>
In-Reply-To: <20231128000033.GD25590@pendragon.ideasonboard.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Nov 2023 21:31:03 -0300
Message-ID: <CAOMZO5DMhTFtVJ8wnn9JNXtb5Rs7zatJcEkBBohVmz5vmwqTmw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: dt-bindings: Use bus-types definitions from video-interfaces.h
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Xin Ji <xji@analogixsemi.com>
Cc: sakari.ailus@linux.intel.com, rfoss@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, mchehab@kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Mon, Nov 27, 2023 at 9:00=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> > @@ -157,7 +158,7 @@ examples:
> >                      reg =3D <0>;
> >                      anx7625_in: endpoint {
> >                          remote-endpoint =3D <&mipi_dsi>;
> > -                        bus-type =3D <7>;
>
> 7 seems to have been a mistake, as this is a DSI endpoint, not a DPI
> endpoint.

bus-type =3D <7> was added in commit 0a61ef9cc30d
("dt-bindings:drm/bridge:anx7625: add port@0 property").

Adding Xin Ji on CC for clarification.

