Return-Path: <linux-media+bounces-65367-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E6isOi0pOWqhngcAu9opvQ
	(envelope-from <linux-media+bounces-65367-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:23:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 535BA6AF6A0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:23:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=B5gsmYbB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65367-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65367-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3105D302C347
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 12:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070C53A75B1;
	Mon, 22 Jun 2026 12:22:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9E93009E2;
	Mon, 22 Jun 2026 12:22:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130975; cv=none; b=Iwy0Zabd/dtmPFO62x91biLz1yEHcBCIVT3MkBZgIj9zr9cO8pyP7x8ddmPKjm/cCPIuNqyvhzskKq07eMW6A4DVgiAM0Mp26/qxY9X98KvyFsVsoEs5ngYKMH+Gx1Z+WejISsAjEM9D67B11pAkvFpiBqjI5zMAIO7p/Xa1PoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130975; c=relaxed/simple;
	bh=0I+ohYFcwVh2zkVhRJUCYf3//PdnxIARzRrHLDrXJ08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpSB6BebJ1BwXHZpXmsedEFEGWTHETqcPTIh6yEFsNHVxS+oyIRv7SQ4Pfx0C+9mXZ21wQfFKyc314ednFH4la+zWiUPHv4zyh0j307xkyuy0lgPV1cZmyPw7dyWzhEO29RIPPiuTF3tTkKGsCo9vWh8rN60CWRHb7VtH6xE9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5gsmYbB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BD01F000E9;
	Mon, 22 Jun 2026 12:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782130974;
	bh=x6/k+CfbBcsKaGFN4gzva4siYcKeEJh+NJUpiIXiDPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B5gsmYbB3qnTpOvSbrW+LkH7MH7gjummxw0kPteL3XfLtKvq0yuSOxI+d/9eeiw39
	 rKFR7Gf/XR+RJTuxv0/3wZ8nMHgwBtX/bn4Kz3SBVlC9xhiQNqZD3K6sk3o0NNWC5j
	 j1ZYbpcPAgJ4TYWIQhHmle5kPhaxI8k8kLUbuFqQMwayfBk6ZOmNe8J2XPzkAoLJLE
	 ouQWS8weAJBdJ6rZpyk2XsVwaYZJ0RdTitt4cm/yduxZdsFI6tDin+dcROfcQVOYS7
	 WxzNqGpVyzfVKMP7REK88zEqNqvO3PgYa9nzknKeZnddmny4ftcP2MDKzvGOQ+hWGc
	 9yLfwBCugS4lQ==
Date: Mon, 22 Jun 2026 14:22:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, luca.weiss@fairphone.com, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Xiaolei Wang <xiaolei.wang@windriver.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Walter Werner Schneider <contact@schnwalter.eu>, 
	Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add imx576 sensor
Message-ID: <20260622-robust-porcelain-elephant-d9ec7f@quoll>
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-2-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260619125439.55311-2-himanshu.bhavani@siliconsignals.io>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:himanshu.bhavani@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:luca.weiss@fairphone.com,m:hardevsinh.palaniya@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:elgin.perumbilly@siliconsignals.io,m:xiaolei.wang@windriver.com,m:laurent.pinchart@ideasonboard.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65367-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,fairphone.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,windriver.com,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,quoll:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 535BA6AF6A0

On Fri, Jun 19, 2026 at 06:24:31PM +0530, Himanshu Bhavani wrote:
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +        required:
> +          - data-lanes
> +          - link-frequencies

You should require endpoint here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


