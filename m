Return-Path: <linux-media+bounces-59777-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLMeCc9z8GldTgEAu9opvQ
	(envelope-from <linux-media+bounces-59777-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:46:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC68848076F
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D2A4303F924
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BBB3D5672;
	Tue, 28 Apr 2026 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bBgekiLt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFDD3C9ED6
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365373; cv=none; b=S8GoSy/b2/YYPKwV32cZmJb+nVmLllRHG0EC6V+ApaZifg0Bn1zwRL8pmiZZFE0+NNaHfQTLYnLTpm5WM408jDLow0B64pCk6i8ewfENO7SDMmU+lpwD5uA8nB06j7PKnNMsTKz83sJzKpoZnAJjfS0bGFEUI4LJqzz0dqZYDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365373; c=relaxed/simple;
	bh=3sAZLj0NLRiBxjN5SeUiDy9R29dqmYOqD3dBKY9fk04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgwiUftFf/54ZlSYrCLluW/HEPv5+pAMbI2M5cQ7xp1QgiwMZbQNg7uHDFefnLl3ZZuRs43+c7jTSA6+erqOdDUw/a0mf/ppsoiVu+e19jQlghpaiO9xK3BU2oNwCeGf/dFbcLvi3LNxwp2VZwOPKnXAVdbJ8SMvn8kNlHrPb/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bBgekiLt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so76852565e9.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777365370; x=1777970170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCY+zuQyx9GlGlpOXTysGsnBwr93z9Zdc4O6jTMzbYk=;
        b=bBgekiLtlNIgO/uCzySqThVdaTvILGe4k3go8VQM6JEZMTFV4ns2aEZLHYv/sFR8ng
         dnv6UkyYmUksewXBVzrfW2ulxHaCZU3vQQ1fN8G/XYz0wq1QxvNYB5XFAoGD7VqpB+pE
         zG3KzmjIRrd+Y87jltAdvHW7gRKeeEvLuiGBt3guJdGY2Aa7HH9N5Rab8Ci0yApBbSCb
         M/x6V7iOGjfgH1t2BKGbVfaGXibLSZGJO/ILdwbQcYBXiQirp9EwaIpd7J/IwxYQ9Dlx
         Krn8pYpqHqPDBycxitQvHRT1lhYZtLqW65I+EZ9n/Fke86+/8CHC0EWdjl7lB23LnGU2
         gZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365370; x=1777970170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCY+zuQyx9GlGlpOXTysGsnBwr93z9Zdc4O6jTMzbYk=;
        b=YPdyj3xZpAFOuciQDPpoUL580Ujv3ynay9gdQ/X0mmPTHuToqmNAtE9CS1swWhTF8U
         Aafot5BMrmvMCKKIxLcZu+BqaO215o/0h9byMVyfQvW0ZLjO1hOyMtdP7biyVzWUKdCo
         0pEFo90bM/tPR3Fs/Z9tzOMxr5lEl/PSC2jN2S9jUmzL0nRSqcd+NlPFVPbrwp73MMDo
         m2TOHZ6pRtVtiRHX8lw/hVfjSOTAsr2Nn9uKzn6WRPyQgxlyUcjCU5LEBgooNw5h90bj
         1pqxSVx94C/lzMkzHciLSxdC1icF5itaeAPhMyoZwJ0tDubaGJEMsKwEC9GuFyNbUtsG
         RFbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HqW8psNPlIxbDABZ5DXWqxLtdKxc29imoKscjITi7lXQ4kldlADf11ehApR3Eg5YaXjO+gBJ0Hp3jog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYjbZN0f6Z32f1LVQf4TUdtKtIY1prCoh3A5PUdEQIw0FL6Ue
	iw1y8E2xaknP/vL1JxI0ZzA8jBhztohJeUHt1avOxDhGBgRMFKK5VLTi0qw9ZQGCyLI=
X-Gm-Gg: AeBDievbwmF0UdTuInAbwFuqmYswweWBjcP211NfqR8lh0OM+gDRnhDCH9AI30sVsj1
	znZ15crnG124gNLRn3NWhjjIN8boV4C/q04Xtpn7yDM86ybo2VBPqTMZumk2TVUVrnHBqiSx1iC
	hIUalVkmHFX3lXgRq2qQV8OQ5HghGo2g1zoKVBkOuzH4s5CxZyF/j33a3chkhhU4brJNX+C43M1
	YtplllzUquOsN9wmxltNUAoqYxq+rZeA/sVjmySYIVHb+sCI1PRgzKNvlv0lDAM7dg30OByZXFk
	80avqpLUIGMOme2RXJO2nGqvhNdYQ3O88ihuFvemDctYhcqgNYdh0c4QSVijlcgCevQtnsoZhIk
	j05h56NzUZP0p4Jpcd+lY28fGjGSi99v47GJ/39XPChLd3LcRlQ7zBg3esSAKHyEbWwUWqDqbff
	LcR78ir3jZQR/TByl+oLQs7TZAXh7GtjXmGUaWVRQgXTLZkbGEq60fmCCQGyKuc8vf9XOEjfuKg
	g==
X-Received: by 2002:a05:600c:83c3:b0:488:ab1d:dcc5 with SMTP id 5b1f17b1804b1-48a77b1e8c6mr34320375e9.27.1777365370542;
        Tue, 28 Apr 2026 01:36:10 -0700 (PDT)
Received: from ?IPV6:2001:a61:1399:ff01:bd7:b9d5:f4ba:1161? ([2001:a61:1399:ff01:bd7:b9d5:f4ba:1161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a775fd14csm13875935e9.31.2026.04.28.01.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 01:36:09 -0700 (PDT)
Message-ID: <937aca8d-805b-418e-a2ed-58c1e38f45e7@suse.com>
Date: Tue, 28 Apr 2026 10:36:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: uvcvideo: skip resume when writing hibernation
 image
To: Haowen Tu <tuhaowen@uniontech.com>, rafael@kernel.org
Cc: lenb@kernel.org, pavel@kernel.org, linux-pm@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428080513.1833515-1-tuhaowen@uniontech.com>
 <20260428080513.1833515-3-tuhaowen@uniontech.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260428080513.1833515-3-tuhaowen@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BC68848076F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59777-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi,

On 28.04.26 10:05, Haowen Tu wrote:

> Skipping the THAW resume is safe: stream->frozen remains 1 (set during
> the earlier FREEZE suspend), the device is powered off immediately after
> swsusp_write() with no intervening suspend, and the subsequent
> PMSG_RESTORE resume on the restored kernel calls uvc_video_resume()
> with pm_hibernation_storing_image() returning false, performing the full
> reinitialization as normal.
> 

What happens if writing out the image fails?

	Regards
		Oliver


