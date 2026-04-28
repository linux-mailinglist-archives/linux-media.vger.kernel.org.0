Return-Path: <linux-media+bounces-59743-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDseNsgu8GkHPgEAu9opvQ
	(envelope-from <linux-media+bounces-59743-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 05:51:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C561047D2E6
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 05:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 745C73010240
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 03:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554F0325490;
	Tue, 28 Apr 2026 03:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="om7wcb+v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D6927FB1F
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348291; cv=none; b=m8DCndpwe30Jylku0VqOHQF401RpZhMfXli6f5PCzEUOSHkAhAWeC+Fjoi8/DEKQvpV5yYuroJZMdBR07RW/cIPNqxY+QyulEUUm+ymY12dLA/X0fIC9hZdkpuVgM0BXuNrWSc45RhyCHcyKSXbEBSxu53kDrLHHLmbgzW0MylM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348291; c=relaxed/simple;
	bh=RQfjDmjDhFBZQeNCmuYx5MyE8j6k2g5d33MZmHmxCmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KncwH6A5Q9rK4ahOiqoCQsYoKADCGKeq10lLSnl36PAq0c+HMD3hlhM16pJe7gJ9KymtnlieNLU+2HEcVzi4D/f6xl1Z/bs+hwYYfSmuPCvt+s3kqGyoHWDv1Ao2CiEyZZeJj5Wq8dDkJ4y6mcqdVpWF0bG1CbDDAmIw2W8YVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=om7wcb+v; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8f231f3b130so334199385a.3
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777348288; x=1777953088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63f4GofBoWLfXQjvxrKaQNrlmvp+JGGyl1KjrPUdmXI=;
        b=om7wcb+v6jOtI69VUjVTFihCYGBnZ5on48uPRzAVMvPTaqFaNcbrLl/6MkV5QW+DcB
         kxPDH4bKZSsy5XmRm6RUPqu+fcooPzoHWEhtjRZAX44M6VDtYXsp9PJa0AlQ564ogkmu
         022TOCX/89rPiIRSdYugVcf4FDmF2hozU9ZqVhVnuTB2Ex2JO9VFPkiLEV1CkoV/C1F+
         CqvoYdDWOskf2ylBidvPs0a0KN4SQMrNQOTTlZ2uEPoEZNlvSQtV3HlOtYfy9h+v8X+9
         0xdTds4jnVnlRDkYlkB2JIi604qcnCLwU4hZMjyQ39PogIL4lNHuMGTgg5w+drVjz7kS
         RN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348288; x=1777953088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63f4GofBoWLfXQjvxrKaQNrlmvp+JGGyl1KjrPUdmXI=;
        b=BzxF77yr1CkdCmt3BS0SM4y1oIvkl4Q6k/TXRfFSRSNvERITWmrz9n6gUq6LVY9q6a
         B9jiY4dHsHUyk90rCf3UXNPWBNv/BQk5yixicwbAVIyf+aIfHi/rsS/cSAmcurcu/zOB
         eRy9e5Bpcl0ier9h/eDN7o0yVPNykbMeWx474Fq2/Ubm9jDlkSS5Gsv9t3rwYipVIWK4
         443jwmlTu4B1kec6tu6P9HvfNz7LoS0GhW86kXKl632g/RJVWMVzxLhcH9DfE/PQPpJf
         VfrAJX64zBUYOdl/J+abmxxudWCDwCn2NqqQTuyjyiiwEwWzWeUy8E4VAAYL1aCF5vme
         IB6w==
X-Forwarded-Encrypted: i=1; AFNElJ92mYeIhaA/fD+DgD3SG2IWwW+x4aA7HWLana023iIuNEFQjKPQCQC3acCvtiuv+3hQmjxVC66uhLvXtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrhfaaYcmqmIkZivrTkVSJYuxBVwvA6HNvyqfZRLobi9ztnApI
	Qxoyl+spVEr5cLMEcr9NUfwZFnbkebFXgWtbTRa6xiepQsO7sOmAB7sB
X-Gm-Gg: AeBDiev2Yp6CfiQZ6dh/+1kPgy2L1GKdE1jsW2a8uMUv/biGu39pa+6CFTBh8/7SDJt
	q4o4g0/oUapwZax1LwhrV2z5SxG9MdNn+VdvJptNTI9615Tf0TLkwl6afgOI7h6d02zmrcf9amw
	2IEucAv7d/z3t+WL5gZK9fqFTi0ypAVNnFY5025qnL4Iq7KFbMGcL3jMkbeWwb+C9tj1yrpJOoJ
	KwE+pi9LxY+IqeYiGAfgVGLvn7DNN7CFw/p0yjgQXr4dsWDK2vfBKGgOS6NfryOkf2fD5q3CYA2
	5RrdxWZdvEmfdEMu69yJsLzBcvoV7FAYP6qaRi9jOGyx55gLyhWcSwp/Do+sqFmrWEuwxA9tS0q
	Nmx9PqpoMwLPNIOggs6hUThxXc9LfNpwjpD2NOOLQpmBMiRoTDjmX41gZgsV5tj7l0FyE+PJMXF
	GGSG4wlW3NnT+NclJue5gG6Hs5i4YRdfRX/djD
X-Received: by 2002:a05:620a:29c1:b0:8f0:f1a5:680c with SMTP id af79cd13be357-8f7d9016b82mr191945585a.29.1777348288133;
        Mon, 27 Apr 2026 20:51:28 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c4dbcfbdsm100150285a.12.2026.04.27.20.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:51:27 -0700 (PDT)
Date: Mon, 27 Apr 2026 23:52:10 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes requirement
Message-ID: <afAu6ueMsjBY-yUB@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-2-mailingradian@gmail.com>
 <4898366c-108d-479e-93cb-f79b27ba811f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4898366c-108d-479e-93cb-f79b27ba811f@linaro.org>
X-Rspamd-Queue-Id: C561047D2E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59743-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Wed, Apr 01, 2026 at 12:22:34AM +0300, Vladimir Zapolskiy wrote:
> On 2/17/26 02:27, Richard Acayan wrote:
> > The clock-lanes property has no effect on the hardware configuration, as
> > of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
> > clock-lane property"). Since boards with new camss support can omit the
> > property, remove it from the required lists.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> 
> If you send another v10 of the series, please remove 'clock-lanes'
> property from the example as well.

I don't think I can send a new revision of this patch since it's already
applied, though there may be an opportunity if clock-lanes requirements
are removed in bulk.

