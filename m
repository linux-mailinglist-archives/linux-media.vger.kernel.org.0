Return-Path: <linux-media+bounces-63850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gm0iKf0mImrMTAEAu9opvQ
	(envelope-from <linux-media+bounces-63850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 03:31:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7E6446DB
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 03:31:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=c2XccfvB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63850-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63850-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C182C30118FA
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 01:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735B43C9453;
	Fri,  5 Jun 2026 01:30:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9398339099E;
	Fri,  5 Jun 2026 01:30:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780623016; cv=none; b=iUhf6qSmimVD0jgqFsSXCqYwN6hX5r5fAJYqDO903FhjwFN7PioK6hEYuy/HgFVBLi453bNkjCXH3DN5L3sGa302DLNpKmQfExi8V0I6281jpl+IXSM8qLc/RoCQdkoxSzSZPYoazXTusp5peL5+oxQr98xkwiP9vvF9zBdiQ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780623016; c=relaxed/simple;
	bh=KXlwYjqKVSUou60rpLkA1iL5cirORHeMbS0KbckVvy8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nLFBIZXWVkcgLShWDnU/Y3jxBGfciZ5hrwPHys/EIi9UlGA0/gb3Kga8Qaf7q+7p0RHZOORmgII+zWeCVByHdNQcd7yo5LgUiA8KxlQ8g7ahvaMMAivjAlS2x3JiORVxSP0u6hUPPOAfZJUH4cia5y/p/ZVCBtOl0WQM0sBSsEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2XccfvB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8AB1F00893;
	Fri,  5 Jun 2026 01:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780623011;
	bh=ehZCtSynk3bTn44G6PMr36RiMYbFetcFDvaiFCTYQUo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=c2XccfvBptzHz55v6NBJeU76o0cvge5jJdtMPa9/lePBC2+4eSf9Ck+7nHbj1/idL
	 SkZB4ajriFpKhqucuZJZsrTGzz/W8T4GAmJ3g809fg+SwkDHRT0ERPQ71H3DyhivHK
	 ahBzevah02Devlifsi/Ixo1HOPZ4n6DsKSAmebn9EbA6JbjCY01uDFOSQ/Em2n7ei3
	 oTtu+6r2F1VcwiHfitR147yOw+9dtBPA8uCZ8SAzCVUWi2Lmq+vWZwtzYU5CWPmVSb
	 FPivH01aaoMCVgbpjeyqvWa4EEFgac6RiFaG4WZw/hqaiZDgDdzVf/tY48Ulc3z82f
	 6pwMmyTrmmzMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B243930A8A;
	Fri,  5 Jun 2026 01:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] dt-bindings: remove redundant .txt redirect stubs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178062301139.3093327.8247260042998931357.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jun 2026 01:30:11 +0000
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mchehab@kernel.org,
 olteanv@gmail.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, dmitry.torokhov@gmail.com,
 thierry.reding@kernel.org, jonathanh@nvidia.com, lee@kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-input@vger.kernel.org,
 linux-tegra@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63850-lists,linux-media=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:akash.sukhavasi@gmail.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:olteanv@gmail.com,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dmitry.torokhov@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:lee@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:akashsukhavasi@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FD7E6446DB

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 03 Jun 2026 15:42:17 -0500 you wrote:
> Several .txt files under Documentation/devicetree/bindings/ contain
> only a redirect notice pointing to a .yaml schema with the same base
> filename in the same directory. These stubs were useful during the
> .txt to .yaml transition but are now redundant, since the .yaml is
> discoverable by name. Meanwhile, other documentation still references
> some of these stubs, forcing readers through an unnecessary extra hop
> to reach the actual schema.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] dt-bindings: net: remove obsolete mdio.txt
    https://git.kernel.org/netdev/net-next/c/ed2b921b542b
  - [v2,2/4] dt-bindings: media: remove obsolete rc.txt
    (no matching commit)
  - [v2,3/4] dt-bindings: net: dsa: remove obsolete dsa.txt
    https://git.kernel.org/netdev/net-next/c/0fbbc19482bd
  - [v2,4/4] dt-bindings: input: remove obsolete matrix-keymap.txt
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



