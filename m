Return-Path: <linux-media+bounces-62971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJHSIV9zGGq4kAgAu9opvQ
	(envelope-from <linux-media+bounces-62971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 18:54:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A79C5F548C
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 18:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C86553014A1A
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 16:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E0D3F8899;
	Thu, 28 May 2026 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsKDbIfA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EA024E4AF
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986732; cv=none; b=tD6OOAcUuAQbAn+31OMmXuMtiYU4Om6/J5QDuJX2QOjvUa10PX4BydPYQPO+G6lHfVDS2bKdh6zI7vUPKPJwzZZy1fBSjeAoZ8QPSXeffM+bIVrvGJb0XwW8rKkAEm+PeAOHLNRCXWOE7raU1a80jWxSt5UHyejWM6mOPXT2Hsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986732; c=relaxed/simple;
	bh=Jj7ML26PQTjvxqh2kYmSYqd9mqKRY/SbRRDvkNUUB9g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mT0x9yempGGpkSVrJTByIjFOFxGs12wYOwNubtyK6MkU4KQQaOjDmp6PUNodRhREqzZqvfS2y2OXrSV17YrmwaRDszf5ViOsr1kug92u8hL9M0cFvbSG53RpRWWljQdIwb7CySlmP38UABCJ5Cfwuh5Nf+fFQdehbMVMfxcuVo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsKDbIfA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso73811985e9.0
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779986729; x=1780591529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+tlXWib7a29ljZjrx5g+d0tTx+x+16PkIEERsQd7Aw=;
        b=hsKDbIfA1w18fYu6ScCpULh4gSfG027eDQc2SU9AMhO8C/BFSc/VtW++j1x9S/dgId
         uJGd4ZE8Vt0jVqIwiFE8uDGvjb9CpRhFERRewi2NmNU4XB6tXHlGz0PQfwFtqvK5C3VS
         C8Q7jo5oR5xGUlqpwHj9WJlcJVB/vT3aDZNXx+UzZtK+iG8NftqZPtBucNmYMjl/kltm
         HhQnXD0n0bb0DCLVBbevWvQTd45hsZ2/aFeGb6esj+OwMz6jJrCt3/5IqcFykbkRJUuO
         xWzB+SxvXOF9xwI/InCZWMH/iucm/yudYgNTMFBd6WS8QGJZQrAA+HItpsil6IHu6/Qy
         6fQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779986729; x=1780591529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3+tlXWib7a29ljZjrx5g+d0tTx+x+16PkIEERsQd7Aw=;
        b=QwyHwYh1DSsHbaFnyPwXU0PhAEosssBTTvpwzlMMVvLfak9sr8jnIZnWKUYDBKOzUA
         Mk9Aj9vnd8najzhg48vNH1OQaOK9mp/vS9yEvJ+o/cXHejykze/ti5AXo/MM82VAACxA
         fakbN9FdpJQAvJebGlSt9LtLHSoSeVYB3jXkaIFqPL0cGYj7WmEwq6tWz5q9AKjm+NPs
         pPXMCWA9or7LwKLNNUshx/XVSsl9iqllR/lJ+JqWL7xJvlT0V6jf5tXPczUt29f/Juc2
         leQ9YlCLPFgAqYUtKmzB4hEMOnJwH3FTPkjTCgozfbupXrddM9dKjGUz+01psBWqSj57
         JQsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9akUahUHchIssj+lu2QgyVDFFKa8xsoXMjq6patEX6MUNogPAzQkRX7go+2Y5PqJ+LtV/mCM+iC1J9/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVHOaU5pds20yUuPU8S4x2ePP+6JJcHu3I/PKixe1mq+X0v/qi
	6xAvVVzrZXxFT8cWziaoXANHx0ttXTOmWJE/D4+A5uq27F1m1zgjy/5b
X-Gm-Gg: Acq92OG+7ca8yutZhEKAqKI75iSB+ZUHn32kcHIsFMyMYsEXh5z3VPwapfHdqAaskNb
	/pNWw3Z0ULHn9rOL2/6WSkh/YYFD9yi0cmnznHnl1qLleMZvf4wBTLaMEX2apMb+AZxBW7fWxIE
	5EWt2oHfovUz5RpuzU8389Nhxf0Pc2MkB8QqCq/8ur+i+W5oAShVqzJxat3RRFvuNrmpPf6rOiT
	ltEdcOR7x0T8m89EAnfL7m6b0SLM9qtJyoijgZ9ZsCjhWviVH9QW0ZMm7Yen2M7I96tuEWZ80MJ
	AL2HbBEjA5GZn7HeAWyncq8CHV9j+ookJklqAs3Yga930Ya/FKwuhNgCLsiA4pYNBHIk26LbmPB
	+dlNUk4OlqqB/YNf/EuztEaMuaJs+vKBh4L8KfcNUaHErPjEnB5YhVEHiMHaqv8YQMsg9ZtCONN
	Sx/gFhMwcpoXhJd5ycmMBg8dz83AOBmVSCTxLzPyhJNbvy8Mda/GxfvbOF
X-Received: by 2002:a05:600c:35cf:b0:490:44eb:c1e5 with SMTP id 5b1f17b1804b1-49044ebc257mr506726775e9.31.1779986729268;
        Thu, 28 May 2026 09:45:29 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a925acsm89762075e9.14.2026.05.28.09.45.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 28 May 2026 09:45:28 -0700 (PDT)
Date: Thu, 28 May 2026 18:45:24 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Lin <henryl@nvidia.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream
 stop
Message-ID: <20260528184524.08e98ddb.michal.pecio@gmail.com>
In-Reply-To: <SAWPR12MB9991187DB56BAB00EB2550E897AC092@SAWPR12MB999118.namprd12.prod.outlook.com>
References: <20260525182028.2148267-1-henryl@nvidia.com>
	<20260526015514.466b72d4.michal.pecio@gmail.com>
	<SAWPR12MB99911841F75A9492A6FA875421AC0B2@SAWPR12MB999118.namprd12.prod.outlook.com>
	<20260526121605.332525c6.michal.pecio@gmail.com>
	<SAWPR12MB9991187DB56BAB00EB2550E897AC092@SAWPR12MB999118.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62971-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8A79C5F548C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 08:36:12 +0000, Henry Lin wrote:
> > Were you seeing one such error for each restart, followed by
> > uvcvideo dropping a few frames and continuing to stream normally,
> > or multiple transaction errors and complete functional failure?  
> 
> On the NVIDIA xHCI host controller, I see the former.
> 
> After each stop/start cycle, uvcvideo reports one -71 completion
> error, and only the first frame is broken. Streaming then continues
> normally. I do not see multiple transaction errors or a complete
> functional failure.
> 
> With 25e531b422dc applied, the -71 completion error no longer appears
> in the same test.

No worries then, this is expected behavior and a known bug, now fixed.

Regards,
Michal

