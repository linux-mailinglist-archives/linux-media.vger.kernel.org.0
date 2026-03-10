Return-Path: <linux-media+bounces-55175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB05JaIjsGnYgQIAu9opvQ
	(envelope-from <linux-media+bounces-55175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:58:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C5251222
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB40C30FB880
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 13:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3201E3B0AE4;
	Tue, 10 Mar 2026 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E51kNjIN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cWw8/5Ju"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EDD3B0AE2
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148932; cv=none; b=f0agSzBBNuPov1vERiUqFtI7fwfkvZD5zRiH0B33NhMYQNLzkuUQXg/pCg4HlJd4zkt6PveEedKm5xU1QAgntcO5akPrKpS1iXFccZHCN6k50gh2unCLuMLYcVuwVPWP0ZHlMFBSavYnIZ8A2voPsgAD1C9ykpUlikXuQC/DbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148932; c=relaxed/simple;
	bh=7C48eJwQxF2SZSyojjO4eehKdtPdDBqSboD/LkVXOwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrfGPWZ4vt+pehsXSyeT6hv9iLuvUkrzAHelV93QNbdblLT02tfzcDcW1dJJp5DJZ4wS2JRR2f6eM/CVy1da3iHdCgLnpvNhhIkjBQee44DunehxcRHyYvwa4HjV+b848EOIKAPqYeygc7R/RcysgiloUzgbFriRIgbN0OJhfz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E51kNjIN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cWw8/5Ju; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773148927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
	b=E51kNjIN4UKbGW9DyZ5aBLaeo/X1fN08TYjWYCgYq8Q8qw25+tZQtb5W5ajU6MN7BBBW11
	0YDBivfD6ObYrVaZ07AfmguXniohVg3EyJDviAgsAuscNKdssFGgICyGTgh1yznjOgNpE3
	ekU6IHdwiHFWZVShb4nqu/2AD28lhx4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-A_y4fVuWPqqWHCwMpBblEQ-1; Tue, 10 Mar 2026 09:22:06 -0400
X-MC-Unique: A_y4fVuWPqqWHCwMpBblEQ-1
X-Mimecast-MFC-AGG-ID: A_y4fVuWPqqWHCwMpBblEQ_1773148926
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd849cd562so1322204285a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773148926; x=1773753726; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
        b=cWw8/5Ju7zxznn9mOxbZtRGP57yWDqx8ETM9vE3NCs3Kvj4CriRCeHSx6jn8AUlVJT
         +I/Gsr0HGGPFYYrDlGd+zHB6BRSju4MPD1kgZ1vAi7fkFWsVVqop5TGK4m7os1pYUEl5
         K1KZk8g4/r2uuPKbZADHHaaLVoxMo2kGnFe2GWYrvN+bOJpgFb3Qw6us5Mo2ieKOACax
         PsxNVYuv70RBqBAseWHKh9EXpuhyCZ3kGBcwEtH0oTS6lCvM63LTS4lWuo6EbN7sLNZz
         0TkHU0wPmUKbz78bVJImjb2zDp8cbqifmyA1ibykSxHyeuQmEkHpTfpK835DIItllhdI
         ytfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148926; x=1773753726;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
        b=d3zMXKq/rN2s1ALQlQxgG4bPTPo/4om8GnZFgopOaSf3MJJUKE1x86nL9Ji5MfREN3
         V4jSzAmJYshhP2tnVUOmK4tsNXgkVvCXVKuzKQkSjvEtdPlBLBQWfJV+kDZU2E6Q7EmC
         e724B8g7pRj9PwobuQq4K2lkouHmAnSBBwkqxHLoCRtXiYXElZBGGxGwubhDDAxtcRS6
         dUnEKzoHSuQLWFH/fSS2ittAMUzYGSLntBzU9hX90s97g+vDV6O+Yq2rjDQ3nRokRr26
         6XGZz97zq1ysHUdqG3bdvDZp2q0Sioa9L/o42mEIGfwlbAw1HFcFYJpO3vYRbGUjeUk3
         we4A==
X-Forwarded-Encrypted: i=1; AJvYcCVPx5JWl48umXnJawImTZiEd33h5qKFWIbHA12MHXE+DHs/ReGqDlD7YTw9PaiE1ecwsva9cod5hgc6Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqAAHFbXwS1U0+KmyCzsMoU0fUXgMzKGP9kvqOzJ4/Q3J71RKz
	WTHCbBIX2+qW97zmWfOtMdOqLcMIOWVqmKclF42qjPYBKEdqxitRSAW0m/ISx1h4tWnp1qF92BS
	F+qGFAMGJNoiUj0M8laPeA1jYE2BstbFYAp3fB8xQLzEd/RTO2SNRoCedmzFHWn3c
X-Gm-Gg: ATEYQzySX3Sh+OFYTk2ES2CX4n9Z36FrDLCIN5bDN6oSjuD1+Hs6o+Md656GOK+bmqa
	/oBk9CEQpmrDCDU2S7L52F//W3I6AzDGj5BcZ0stur5KLGuLkF514w4rqtq80jNbDCDl9rAO7ns
	mF4t6GbUp8HyOUMM57kfPyszTJAwmygYwIvBbxuc69nYz2tdVPk+YwvpDz3h3IkAVFRfBxHr3ZK
	1jt1HBEx9Go21AZBEiZLORqQHkS1f8DNN0pCouxjxq8jhZzJ0yQeat3rHZPro5FZiZokjlPTJ3L
	xfuo7jfxjtuSkYvojPH7ftv5sJpiv8YC+5nxM/KIXdIEmaBemDfKeosGWtLM8CbV/HVnFSo9bJY
	yJSzOO7F7aFlIRvt6UG7XSbDkzKyHl0Tj4PPHOKQHkcG4e6CYDUsTqZSu
X-Received: by 2002:a05:620a:3713:b0:8ca:1240:4991 with SMTP id af79cd13be357-8cd6d4f9469mr1830786385a.45.1773148924712;
        Tue, 10 Mar 2026 06:22:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:8ca:1240:4991 with SMTP id af79cd13be357-8cd6d4f9469mr1830766185a.45.1773148922638;
        Tue, 10 Mar 2026 06:22:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8576db0esm474754485a.47.2026.03.10.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:22:01 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:21:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr,
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
	sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 56/61] clk: Prefer IS_ERR_OR_NULL over manual NULL check
Message-ID: <abAa9vQg4BSxl1BJ@redhat.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Queue-Id: 3C8C5251222
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55175-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[58];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,avm.de:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:49:22PM +0100, Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Semantich change: Previously the code only printed the warning on error,

Semantic ...

> but not when the pointer was NULL. Now the warning is printed in both
> cases!
> 
> Change found with coccinelle.
> 
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

With the minor typo addressed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


