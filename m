Return-Path: <linux-media+bounces-52542-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3Td1Mm1/i2mPUwAAu9opvQ
	(envelope-from <linux-media+bounces-52542-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 19:56:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F55C11E761
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 19:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D7A33034562
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F7738A9DD;
	Tue, 10 Feb 2026 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymLg20ZX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3681E4BE
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 18:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749796; cv=none; b=ItMMc2Tlys2Ta6DC9yvnKlGaI71WaIH9dfVDBoWhyaTmsrurM/V+AHPcFZQ3oNk4bI2rpqOVwpc6NzhNcyjRg196tB735RiVmReMOaCXjaWa0Qd62UbuAqoYTntGUuJ6h0vlAlOlE7f+UXR92Xaly8EpW02+bgTzWpEp1K/1lVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749796; c=relaxed/simple;
	bh=ABvlyae2MlPEweeMTZz0vfbAFZFM6fkqgTeO+cQ2S3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PL9zh3TJOmdUexMZnBGNJSak8nZxc9AixTXCvRxvqu547LTAiLI9tu5do8HJygcOLnGNhLxa/r1OVkXhHD2AH16r6OsXP9pkNsMZDj/e5jeJXmiyhuD/U947pDNlYbctBofD4SdpjnvZ1Fd7Gjgfa6cDY0Iqat9zWz6kjksQvGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymLg20ZX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4359a302794so2932402f8f.1
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 10:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770749794; x=1771354594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6RmJydaHiLh6n5RPYJgTi8IL7eje4FP9OsyGcFM1QbE=;
        b=ymLg20ZXUxABsBSjjbEudyIMXNEwURZnn9VUstFmA4YHrR8B3wnAdvuCsXbuMkmWO4
         QZPOLC/no17L0qjAow9JIKsl0WPQkEfHTipmSc6KH7cdkRkai8eUMt0viyguKetUba64
         ciyVooj4dhf7PeiH0bhNEXdf3Ct3iDELPSE1YsMkeslrNVz1gOkV5Ixjbdu+Ek3mAeJv
         /AVMIWigkMidkiYswGmJnb5Gq4yNQD9KYWh/bQjDoGIGKgywTohz5CZrlGQuqWlKGlLu
         oKxJMkuSpIz7ir/Yj0skg0ihqBA9heKaxE80zWRKWrij9j9qd9WybLJKF3FgTbOO+NrE
         5ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770749794; x=1771354594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RmJydaHiLh6n5RPYJgTi8IL7eje4FP9OsyGcFM1QbE=;
        b=O/gblqTtBoOgieIZWRrY5N8xWFCVxpHvp4RRRhjxzLAyif9k8yVXynlgTcCNSYUavv
         LPxlosKLVbLTL3b9pCaSS/JxMDxSfBmEzy+PbsyTAo3DzZ4l6yg+Vg/14fsjsIbP3KkK
         ppvp4j6Uqa1Lf29fTfO61Dml/69mTrYodBk63icOCdDvz/d21Ahf73OifsDbBPStHCop
         XZ1rR0TYEtYOR6ne99FWWz5wePZITZ3LGdT9/GH5qTTymaIWKHBzXNpY11i52BS0oYrU
         OgY7NhY5FVneP1LjBof+i2PXAabtjP90RzrJx5SvyTTf3Rg3MqTFxcsVQIaOxLJbhMHb
         KX0g==
X-Forwarded-Encrypted: i=1; AJvYcCWjyIJpDfgO5DQ/i5Pf4/lQnPAveWpTEBFSiLowoKEiR96XQlk+jmiU/KkdDUa3Jqre/ASEonPs+m+MEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmwIJ8ze5P9Ec+Pfo8oKd11Mj4eLnu68v5LrAfWbwjQRd6Zeq6
	M1epEnZ9K0t1vSPh1WBtW//pWxEcs9LaJ+BEyKmkmQ9Kwzc2ZzYIvnpo7M7KiaFLlBo=
X-Gm-Gg: AZuq6aK0CSpv1rugrPkIAt2W2mmwgDUWg89VuGXRQxNnee/c4UdomiDKeMGjmkf/VzG
	pLJxG7R+Wwq4SqrbWhBYwfOqbJOyX3HLX50SgSMRR/uiN7kZaO2gSgu8VRK7atMqQ/Jcs+7hS90
	sQgMTr+GrmZX9eIhh3ThpOuMOvjxBp/RGuhqq4tab3YNegsIGVas2HxSXH5ZIqA/69Yk/DCFzmf
	TJOWbkQnZc1aJvnRArjxhigcMpWnaTgqOgJ/aMUpMdI/+FQ5Z629M3bY7GbMZ6aB3CHVZvUqVo/
	XFaxOU+KxEUhUBo9huyan1vAE6k2+ltU2v0sYkNPOZfNzQADmGDRNZoadqwzCiFAlxSG1iDTfpT
	gMClAdPh8wyx+nZNJ2Py6ELwpzoPZSiy3hj9STOhlR4Rkfwf8oznssqRJYSRRqELhqqysK4b+7Q
	qpcv1iFS+3Xh/S8xgEGuZ1xv2ecVz8clHtrM6jIHY=
X-Received: by 2002:a05:6000:18a7:b0:435:b755:c67e with SMTP id ffacd0b85a97d-43782cafc5dmr94474f8f.49.1770749793651;
        Tue, 10 Feb 2026 10:56:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b25casm37247623f8f.4.2026.02.10.10.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 10:56:33 -0800 (PST)
Date: Tue, 10 Feb 2026 21:56:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: soufianeda@tutanota.com
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Message-ID: <aYt_XvGGEnnhi5MK@stanley.mountain>
References: <20260210-atomisp-fix-v3-1-b2efe28a6c53@tutanota.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-atomisp-fix-v3-1-b2efe28a6c53@tutanota.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52542-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid,tutanota.com:email]
X-Rspamd-Queue-Id: 1F55C11E761
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 04:45:23PM +0100, Soufiane Dani via B4 Relay wrote:
> From: Soufiane Dani <soufianeda@tutanota.com>
> 
> Validate sizeimage against the allocated frame buffer size before
> hmm_store() to prevent out-of-bounds write.
> 
> Signed-off-by: Soufiane Dani <soufianeda@tutanota.com>
> ---

Same review comments as v1.  Please slow down on the resends.  There is
no need to rush.

regards,
dan carpenter


