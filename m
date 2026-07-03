Return-Path: <linux-media+bounces-66520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dC8mHTntR2rnhgAAu9opvQ
	(envelope-from <linux-media+bounces-66520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 19:11:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5670493A
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 19:11:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="RBHB2g/e";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66520-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66520-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9788C302F408
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 17:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0EC30CD80;
	Fri,  3 Jul 2026 17:10:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0830C144
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 17:09:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098599; cv=none; b=p9qU+XqcSEkgUaIPBTbAjPnwMHY/ZvuJuwPyV4TrGHQQaP2OKUsS/Oe/P+Je+ONiJxv3Ll0FCVmdf+n8IN5rHW3mSvRDCYjfukjmG2TItbWDrQzPjOX3HLHigOKip2D7MH63ntzpBxuFImpb/sL9yAtMfVzZnB/AkW7bWHkOh2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098599; c=relaxed/simple;
	bh=emGfKnmIZb6rCs8OZKzdZXrwFmAuQEq6nMNa9HGSfnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zx7C3nyo7/t6cV9/VdddMmNgINqc16QtB9WVMJToonLqaDbxcdxUnZktb00l91dZ3aMkeh09a/YaPbsevmrN/w74q9AWeSjSdAnK5nPLsL+rBHTuuu8hcS8puXW8mRgqouW35tnQHGwsFxWijoslEY3+FWIhsalhKsgmnw7j0Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBHB2g/e; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so5863785e9.1
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098597; x=1783703397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BVVBWacKQnUKHRJ/kNMwnkPuIh3dvCLwl9oDeRFKEKI=;
        b=RBHB2g/e6ijufvET+gxYBqY51EkljKeCzobdWq//vxzxbADtOt1DHtWiD1jn62kxeh
         jg/sH1hNIXd2mcTRz8ZNnxRBcWrVOgZVpzjPNBCGTLXUI0C0AcdmCQ7s0hdNxeI3FNby
         j00JDfMXgQ4JADKOWr4kttn0twUAdl5Inpza4aSS+FGSJGcVBhqnXiD1k2ZbK/QjrM9Z
         5kBAsToJ5naREClrrcd9whva+qBwOpS8ehAulz5Gy4sHLyCP+JrcRF5QkeCwYlL9+gb+
         OGf0r4YVxAur1xQNYJwVrUhYZD33y7F3UnOmmd08vOrko9GurdPZCkC5Ewu/WFT9lbhi
         XohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098597; x=1783703397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVVBWacKQnUKHRJ/kNMwnkPuIh3dvCLwl9oDeRFKEKI=;
        b=kI0/rZIyaKENoQzH6zP5PQTMybqBw7EjoPw1JLv0jDicvUkdLX57c63jtYqHQXro3r
         itq4skQKa/LrejOuB/VKJTKWEGs8yMVl9S3B1dScePNbhDUI4ENwebP6SZLjgK5my/Yn
         19Jilo/ahu3WjKz/iC6Jr5CAWv47BsvoJx1gAjutfylQ4DhmACHsIiHnwzDXMmlhkiqO
         JBeLhn//UeDSOgcPZnDVCdsvgD3SqlWl7Y6FwlWMQ/wprMBE+XmPWZG9AMofI9VI+Rpi
         ADQgO73WgcIZiTDm6YLu4YvMZVJB1fcE7vIvJcPRzmDG24y8eWSEH2yQuR2CMCfcLEBJ
         rGRg==
X-Forwarded-Encrypted: i=1; AFNElJ8KQLzFjszMFXy08qar7SQOge7QFBbbdmv8CNYmyyDqjEmk4sI6St3klO/TN/0qh6OQfZUslo1l1C3u+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLlF9Kq8i+7uu8IOFS/qmk8yZg+hjDpsvAV5Tz4izKr5OS4spq
	uYOE2nAqNU0ryiLqE/zDnvI6kM9MB2RZoOI40sfjqpDJEe2ouavnBSmL
X-Gm-Gg: AfdE7ckCjZ3fAq6e4zawPFkcV5SPnseSbI5LMDxRSQfV/mrBPaIQyKWMn26Zlo4C4y8
	zMAUamXHoE1fpZ2u+ASVIct+MrL62knwYptBkOa6BX96m3oHw1gh7ShE2s2UiuAX8jreFuK0amO
	wzGItywcV207z/myRDfJZdfGxrobIQZR0cbvyZcmen69BWbv/W6mYN2/RLdfMSx41doyY+xGjno
	/2fNMcpvovvbrhQUiwYlW3yk1KqPAgLlRCLEW/JUW+i8BPXb95yACWHoPcIXicR5xdt1P3qRcpZ
	UWpcVg5NQgh4sQDNwD/JUuOT80NP6oRFofBa5Zj86wREXI20iDI9haieAwJz9eVFbK6lxl6N3RW
	1aKbzOzMtGThdzNJF7+H0f5om+vrWV18qHqHfBQ9ZGWDrlpSvrvBKQ4n43jv+0WiODETHfiaOLf
	BafizNzvCJRnsvroq2h8JmRpDkqVfiunO3TIiF0e9CQwWIZGHR4Phfs1A81SDoa+1FZhw1OlZSn
	WotbiHQ
X-Received: by 2002:a05:600c:6087:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-493d11f2920mr1870605e9.25.1783098596625;
        Fri, 03 Jul 2026 10:09:56 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm919323f8f.4.2026.07.03.10.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 10:09:56 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <297d28ae-78ff-4a15-a4a8-0de6a9e2cfa5@gmail.com>
Date: Fri, 3 Jul 2026 18:09:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: camss: Switch on ICP and BPS as make
 options
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
 <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-6-595df9e67790@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-6-595df9e67790@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66520-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7B5670493A

Hi Bryan,

On 7/3/26 16:51, Bryan O'Donoghue wrote:
> +	  be called camss-icp, camss-ipe, and camss-bps, respecitvely.

Small thing: typo in your kconfig help text.

- Julian Braha

