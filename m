Return-Path: <linux-media+bounces-55495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAW8BMmvsmlGOwAAu9opvQ
	(envelope-from <linux-media+bounces-55495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:21:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B52719CE
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70FB3306CE3D
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 12:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2F0282F00;
	Thu, 12 Mar 2026 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l9SUDvHJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C240DFA5;
	Thu, 12 Mar 2026 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317896; cv=none; b=gPFNlWXXKaJLqe8RshsdjRSdPVyoLIoz7rziPJN6Vkqm/VX34n3HAY7Ks6qFEK5gkbsUV704qv2gyH4ei27iHid6r+n2fE3Kg7e+NB6WWvCtEWLqwdww2K2Ns3XKYX9s4JWEbovvQ/IDixQ9xKiL0kr7t/Nf6CUF1SzhLsnQNZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317896; c=relaxed/simple;
	bh=Mx6iHAvnmM6/0FxSpPt+t7tImO3RLU5SX4cXegTEh4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UBcNROnJUUpzeq0ySyIras4qQmwAQ+wTdk8oW+dqzB+SNCokRLf+sn/wGf41/Et3p0kYPuMgqk9e2/DTRv0U0FLFRN5vjjRHOF5v/x5Uya2tYdBKVMFD3sOe2iaatLTohgj09PAxkWnOizbF28YGeL0AMVsrokAPbExHVqrah5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l9SUDvHJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3517511FA;
	Thu, 12 Mar 2026 13:17:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773317825;
	bh=Mx6iHAvnmM6/0FxSpPt+t7tImO3RLU5SX4cXegTEh4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l9SUDvHJM5wRLsAwSWKZSoGMOOKDkL6SY+GScgiXj/L2/41didfnfdCLqCpZY2wQw
	 FMi7lM2QdgCiGGbSaRu8HZM0SR8pgvpq7Nc4otjeDlDqKXO8AavGo01m0Oqs5ni7bg
	 c/W001mtu6j0t4eWHePjHSrdDYTPSf/AQ9Z+pGZg=
Message-ID: <377497e3-6979-429a-b1ff-4ca02ce03966@ideasonboard.com>
Date: Thu, 12 Mar 2026 14:18:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] media: subdev: Add
 v4l2_subdev_get_frame_desc_passthrough and use it
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
 <abGwRZWvpv4XZKx5@kekkonen.localdomain>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <abGwRZWvpv4XZKx5@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55495-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A43B52719CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 11/03/2026 20:11, Sakari Ailus wrote:
> Moi,
> 
> On Wed, Mar 11, 2026 at 02:17:18PM +0200, Tomi Valkeinen wrote:
>> When writing the exact same code the third time for Renesas, I thought
>> we probably need a helper.
>>
>>  Tomi
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Can you send follow-ups to v4? V4 is already in my PR to Hans.
> 

I have sent
https://lore.kernel.org/all/20260312-frame-desc-passthrough-impro-v1-0-30f64d637a3a%40ideasonboard.com/

 Tomi


