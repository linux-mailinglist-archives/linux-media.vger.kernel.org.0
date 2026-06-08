Return-Path: <linux-media+bounces-64155-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3XLlD99+JmrbXQIAu9opvQ
	(envelope-from <linux-media+bounces-64155-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:35:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CEE6541D3
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:35:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kvOg2VOe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64155-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64155-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9F823064047
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 08:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8CE3B19AC;
	Mon,  8 Jun 2026 08:28:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34103B0AE7
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:28:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907334; cv=pass; b=JxszxEo4I4J3AfA9JIsuDmLZnxtPz7JHjlXni6twAfKkm5aOzyaRrOmfqMdorZBPyDpD9sGVIlFJfUrG1njrJm/jeDIoLanOOCGhEHZTia3lUhRc7RmmDIFWLouPIWYcJLKhspA44mWmekADYvxRMHhEyJHQyIdWNMmYe1TXoWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907334; c=relaxed/simple;
	bh=8kyrtUyTTfzFV8/d4eKv2gNhlXqnhCxH61wlDqa9yQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cH+XgpXJnc/M8FLpS+13WFWoWk2RMeEx/R8bPAxM63drmRuOFIS5ccHCS1ZoimRoWz8BHlPEooSS2Q8Czxsrc9sI7XXlPHShxb3m7AxmhyglaOxfVH/m/BrGgVvF63B9OUa/hp5QkgEbpXivvAmSReC3gFcfwB6n7DTcZ+n4N68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvOg2VOe; arc=pass smtp.client-ip=209.85.167.193
Received: by mail-oi1-f193.google.com with SMTP id 5614622812f47-48670d35a87so2849979b6e.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 01:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780907330; cv=none;
        d=google.com; s=arc-20240605;
        b=UA951ZhlIWjkUdygEbbVvxWeb30v4F3HgOeXPX7iTWzsdBl/p44Q26fNSZcA9lMloY
         nKYc6E6Pm6l92zNDlfx4b3RzPidPCOsw4QPFkYEiu/1j0LzKnCept/GJc5j51V7IXJBG
         WXD37hKNB+cdKiypasA3UPgE42lOg7Xfu9it2VUVQFtWMtFzzTcSoRlzbd1SlNiJoqx9
         8EX+JS0JJqe8nGhsVxnceEr2GM/IwIwT+p0TSiTXUkoCWsAGEe2cfJbl7oEF1gKM2xkg
         oMaTq4Pn+9rYKLcBgLVbGepGGVPY/AJ355RplrUbczHCzoemnRimHXmcALraTtPXiHge
         +8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8kyrtUyTTfzFV8/d4eKv2gNhlXqnhCxH61wlDqa9yQ4=;
        fh=9VqDEtibuWrsgFTJen8fwsA3UKJZol9UDyWZk3QCKUI=;
        b=kWxcY5RmpRPOSwA6mx1q4CVYFq7HKO8Lx8AZywpoe5fs4ylh0B0KtklYaRWlriH4Ao
         0xIfAnXUfPEGMMvi1i9n0q/6LeeT5ZhQGXp71Y+3cRuZWV5lcceCwUmTcj/9cYrr2d+v
         G2q7dLqKbtwZustbFrb7O4Tdh5AV95ZDgNpZZX1CoWyIbMWmGnBWW8qxj79L5vMIs5fT
         sUL2hkJBphIRmbMHtGojWdFAxdlcCeGwbR7WW7eCeFDEIoHAHa7591hap6c8j3zsQzK3
         U+mRsCyPAqURMvxKaAQ1FrUoCKfvj9QqOMhfPLlE9UwM0zAm+Lg8QgqRIDRBJb5bYctx
         6dDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780907329; x=1781512129; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8kyrtUyTTfzFV8/d4eKv2gNhlXqnhCxH61wlDqa9yQ4=;
        b=kvOg2VOetVXbxuhPcxGSQRdFgM6tRD793X7DcJ+XkWG2/Tdl2g3ju98QIjQhvTID53
         dLDTicr2NQsu15vRBCi/DCYffMXPsFpmC3PzXzl5nGiccemw0jdxDff2Rb/SYxr/kgKh
         oySX8MSQsyfrQeQ9miOq0t6E038UJODWPtfUZ0BKqGyEoMBHsgaPOvySytoFwJAjq0B9
         JHQwaPUvCxW4COYF6ZvwLd3Lt7uBndeMUiabHZAfjAoaC+X7EGroFzjFKsrljEH38wHp
         uhByJVbAed8RtHGAnQTHAhluRoMv6gay0XbS8xQoZiBco5pVoUKGVQRdzeTeegW9M8Z1
         dZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907329; x=1781512129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kyrtUyTTfzFV8/d4eKv2gNhlXqnhCxH61wlDqa9yQ4=;
        b=hwDI+i+3szeH6bYkexQzbktvaahZs0qxiqoMXcOfcfDiM8nQQQnuSPY2wpsxfmX+yW
         8Yy4w5peWnDel4s80eo8ETdaY0ctqM4BDlXPlWWoXISmm24AWX4pioYxtkFWEgCj2ber
         5Q3bnZl6Y/FvU+VZb9/Io8ku+/BN/7TZ78KOUl8WJ+eDKgiW8LvReTHNbD1eXgKujq7c
         p+kNVz6B7DnjStniysLyA5of2eg8gy3mmE1sZ2WTW7X5DYCzSiCGJcPkqXs4eUa70Uj5
         cToH6wcWop0sGAN+r/RNlAi3jtbCJB5NHiWda2mfMn2PBsq3ckdOrHq/fitzFzo1QuPF
         dTyw==
X-Gm-Message-State: AOJu0YyeWV9W8d1WGY/M9/aY5OgzrRf3c99Us924WME+FydAdzb4vzf6
	OMk1+xi8vaqUwq65H+PTyH8Xd/kxsmZ4gRmEICBK07qtg75dCJubbqr2ECovPFDLTa8HuKm14/2
	HA1StGJm3RV8/2gkiedGZeuNrjNF9F6U=
X-Gm-Gg: Acq92OEjls/gQd1RqHSmzFBYpssRlWfpUXmvFbv6Wno1/MS7A9RypkAlNLLs3GFZCfG
	Z/sbpufdVGoLWEik6W6C47L5UZQu5zQxs/BEQ1t3+ulSlYgh3jIFIpxpWElHY49Sfxr9kCYkXct
	zbz7wRqnT8vIGTZhSpBLjaiDXZW4PfvST9dT5HWlHXPY1OBBnZIuUsWq8H6gQEpqkYa8Do4DYmM
	FG+IgaU3JK0ANFJ6n8p/MpAh6E4dedj8FpHui0S57V9MnuevZT3hVaBPUOpYY2QvIqoVjbMIolY
	cnffr3NZzDLwKIoj1nPY89YXOoHKRyiAY+C6Q/LAqvhftTHPUg==
X-Received: by 2002:a05:6820:4cca:b0:67f:ace6:2fa6 with SMTP id
 006d021491bc7-69e6d2fafbemr5660501eaf.3.1780907329566; Mon, 08 Jun 2026
 01:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608001128.80090-1-dennylin0707@gmail.com> <6ce9188f-aaeb-4ce5-bfc1-28b4f45a9224@oss.qualcomm.com>
In-Reply-To: <6ce9188f-aaeb-4ce5-bfc1-28b4f45a9224@oss.qualcomm.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Mon, 8 Jun 2026 01:28:38 -0700
X-Gm-Features: AVVi8Cd12ce3qZkErmMP-Cc4dXmDmPZSlqJ5AVm997CY3MwL6bNiOIJJus8fyC8
Message-ID: <CAGEkeHdK6EwVtJwSHNqJr8kufkqBsbyMMiL01SpCkzSF4bkjGQ@mail.gmail.com>
Subject: Re: [PATCH v4] media: qcom: iris: guard IRQ handler with runtime PM check
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev, bod@kernel.org, 
	mchehab@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64155-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5CEE6541D3

> Have you actually hit this issue, or is it purely theoretical? We
> shouldn't be receiving interrupts at the tail end of suspend callbacks
> (and there's a disable_irq_nosync() right after the HW is disabled)

I have not observed this on hardware.

My concern comes from disable_irq_nosync().

Its documentation states that it does not ensure
existing instances of the IRQ handler have completed
before returning.

Given that, could a queued threaded handler still
execute after the VPU has been powered down?

Thanks,
Hungyu

