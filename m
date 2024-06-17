Return-Path: <linux-media+bounces-13454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E7C90B460
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31EDE2856F5
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797EE13B29C;
	Mon, 17 Jun 2024 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/mwJID7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E173537;
	Mon, 17 Jun 2024 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718636876; cv=none; b=Tf2Vg7S+Q8Yh8XFcDE6DKBENwxNwEP78tLzQyKjSWWI73OfRZZ/JvxLTGANEku30BUMVF3+qHF5vHk+5JkCui7TGJIco7S7I7gwcLutQ3KVtJwOclUNggZUnBK7DCNkTQPOzq2yHiEZeko8V22aBeBtxQizwe7uF3zUwdlN9QE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718636876; c=relaxed/simple;
	bh=Wvq7JB2dJkIxaCc+ZHbqsZ5qCkHja7eq8kCPglPhfzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OYUa3n1/T+UEwnjsDM7PVlw2yBHgTYNI06W9qi39cE+7oFmTymXseYgmbm4hCSz49UXwtZJywUnJuPnF0NcnhGSmwY++vRNF/N6XHg3D15W7O5D5oseOvfNtw1uk6zcvb1iedt70BxJD9es2E4J3Sd6lAd6jf7ptCwA+q8k58Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/mwJID7; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6e5fd488d9fso3327945a12.3;
        Mon, 17 Jun 2024 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718636875; x=1719241675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wvq7JB2dJkIxaCc+ZHbqsZ5qCkHja7eq8kCPglPhfzI=;
        b=B/mwJID7VBU8o2NpO29Y4Jn14TAIaixH2u4EdtLlMRIvd9gbuzreyKqBn8BEwPQfaw
         PXyk6qDr38HeZtXHLvVbl3z2JiW8fMXECNPr/zOL3l7PwdgI8htVdHdpQP5efXkaPODm
         kPZaGK1tGCnPfXLAWSrJWLaulIL+jK4VkA42U8IP5RwbOmp2aYZsyuu87srydcFZVN2y
         f+tQNN9HI4p/Gd2uZQYBRb+6hORvGbrBAG7BNkUqGGL6UHK+iEHkvyki8vXDLbYsw2sd
         NRupv9roJMJ8C892/Vx70Ip40QZfl9mR2raF3gNkQ1oL8QxWJFX7m7rrVCeQAlXQGhMJ
         1HfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636875; x=1719241675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wvq7JB2dJkIxaCc+ZHbqsZ5qCkHja7eq8kCPglPhfzI=;
        b=cGjzbPhBCL9dhmmRY+UlsGg57WyJz7cI7zy/61iF4GMG4zstHzvcojLWOH2Rad8VK4
         hU/+DqtWuZevYF3nngPq6STFa/OEBdg3vu8djkZmTtj/XlfBuAQTi8B3KKuUz0G8k8Op
         u/IKRCfLiroqAkRxQ2XUu7+k/TFs7zqUPechEjFLRrOpOIzbQvDXUMaqOfaXSJI12bM8
         oZxaQwZuII9fjOyosswTwsCwWvYujMc9WlwfCK01fCbawOjZTC/XsDVdleJN2Aqdvu4a
         vtjGAG7tuALjceU31WNkgw++YkAsGiG2DImiGMcr1A3co1BCk0FaJHLyochOMkk/9bOK
         obqg==
X-Forwarded-Encrypted: i=1; AJvYcCUrAOQ6jb5lNIk7opFD5mkW1YxVCm9fkPrrlzY6bBhf2FwK5U/BZUsDmaq/K78AxWAZaIWCmoIXv5lWq0RsYgA2u2akdwT6zRjJSQMCYU9yU9VtgeT02NBWlXfX25E61tQhsqrAQPfL2XrcEebfRhvA6SZGLqYo/yC00mVy72j+d9K+eorM
X-Gm-Message-State: AOJu0YwU4W/A+UXnuVFwRR/YFHdbC0VXyeJKpZAzTXFhsCHvF7QNTtRA
	obyeGUmjoPXqYUe2qWml2vzx0lWsF0kckZIP/OAUL0w/KZn7Xcz9M89jzmPmRkEFIw==
X-Google-Smtp-Source: AGHT+IHkOj1mqBJ6M3NCIXSRb5efgDKM2OF6jZQG2tUY2qPdc4XHOeJfP5NrohBZfsLvlXiRw32fzw==
X-Received: by 2002:a17:903:41ce:b0:1f6:3721:bca with SMTP id d9443c01a7336-1f8625ce609mr140905675ad.15.1718636874744;
        Mon, 17 Jun 2024 08:07:54 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee81a6sm79939815ad.148.2024.06.17.08.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:07:54 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: sebastian.reichel@collabora.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	ezequiel@vanguardiasur.com.ar,
	frattaroli.nicolas@gmail.com,
	heiko@sntech.de,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linkmauve@linkmauve.fr,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	robh@kernel.org
Subject: Re: [PATCH v6 4/6] media: hantro: Add RK3588 VEPU121
Date: Mon, 17 Jun 2024 23:07:43 +0800
Message-Id: <20240617150743.30382-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <o6iccgurpi7sraq7plxaccz37i44te4jaqicnp2nqbke2qtskh@4kboulg3zywx>
References: <o6iccgurpi7sraq7plxaccz37i44te4jaqicnp2nqbke2qtskh@4kboulg3zywx>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 17 Jun 2024 13:30:52 +0200, Sebastian Reichel wrote:
>> rk3568_vpu_variant is decoder's data, typo?
>
>See first sentence of the commit message.

I know you want a different compatible string for this VEPU121 beacause
of multi cores. But rk3568_vpu_variant is data for VDPU121. I applied this
patch and from output of command:
v4l2-ctl -l -d 3
I see h264/vp8 decoder, which is wrong. vtl2-ctl output of this device
should be JPEG endoer.

Best regards,
Jianfeng

