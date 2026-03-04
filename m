Return-Path: <linux-media+bounces-54421-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJazGlK3p2mMjQAAu9opvQ
	(envelope-from <linux-media+bounces-54421-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 05:38:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8BF1FAB6C
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 05:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 308B5307097A
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 04:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB8437F75B;
	Wed,  4 Mar 2026 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a4PHeZ54"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8990364EAF
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 04:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772599107; cv=pass; b=KsOjdbh+Ek8VCN5WuU/cZpzq5x/v/xf9j/xBwAS+edn7yosj2XXPdAzRJwisH8z30ss2frNqJedya6tDxhTLlDeLm21NWC01ahlvbH/AQpeuOF2epFEJ63lwDw1NnsvVrKpwms+QgndweKziIscSFfF7ZvRA8m9iDohVvwFiPnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772599107; c=relaxed/simple;
	bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElLyxTWvkLnSmsY79vV+fQcZpPEWvUoFPEPTdGUO4sK75LOH6gHGJ+bUxgTbBnqCx4sDywGvoT4jCDJyIVpqDxPzP8yGSnJ9D2b2FT2I7zohkQ+BUkJahufdourq8VawcdsZ9Cx5idQ2ghNF2zzVPU8pBf/hDlaqvzaXOBcNpKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a4PHeZ54; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b7c2788dso1894765f8f.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 20:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772599104; cv=none;
        d=google.com; s=arc-20240605;
        b=IKA1ZEaWYJJOvIKYnIn784WhDDuqKcgm9XNebMpfKuzz1CYEMq3jbN+ThAxfj4dwzx
         vVzXRrsg0OWzjjM9ycI2yCrKPbH2gnEAGOC4ZVkblHdEj/Deq0A6HWK6hRlvU3jj1wMZ
         5s3ItbrOETABJv+qNKUSS8W3LyrZ+fPcFxCu+3RpGyDIkJeiwIjmspg9W3o5h4MgKK7y
         y8t/aBxybOgOoWWd1phwseQqn1KlRlAfSw/wq9Er6Q4MxIgL1mSegAQYwCVYMGD4a8Gx
         +7hqIokrVJO1JPU8FxuRCuLrQSQEHImqU3YnPEhcqW8kqWDWBHqDUxKVsdA1fy/H+Jm/
         nhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
        fh=PJhpUqKcK6XsA32CPbg4GadifWYeBdmZyjRzAbCeROs=;
        b=exMH4YS2+MyJa4HiBQuVeuIvDWY+kJ7/j9T/0GK396UxpvIoSx5PVicWUwmv008RTg
         NpmVdVyKFcCVkSsEz1Zfn+wQtvHp5gksqHSYB8p+ezYQHiGL7xjXepRk8TwVBOQJwmxN
         pr/3Hr6TNY6uB5Q2bmxgPoYpqoj55cZstjaBk0BeCGP6ZnBxEKdTyQIf0bq7WO95hhPc
         iR3AcnvF68FNCFJ27EfdboJGBnlMDa4oR0Zb/g4ua5awoa0ZKRaMPhMxyCyKaBkAGHIA
         dzXFusGKG7qkFiQne6yXuyfoO8Tup96lQ71cNwrThElQo48OQ+J5tWqR4CzaQyyJrUIu
         3pQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772599104; x=1773203904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
        b=a4PHeZ54fqu9d5dVPFbZdcYJfKNZS+n8sza8UdDwvU8W4oplBUnUD/bOWYZp0p0nZ4
         u1LAKHQE79lkTqYphT2+t3/e49W1AS19x2WUd7+bHfgEe/E3B/ppmxlX+nZIX2XfPe/n
         b7+ojlG9jM0Ofo2VjunjkP5jdv8235577BTSXAhOqVXpLoUYs4X7f8+SIatthXA/6+Pf
         pMvaHpKvauMBQWkhefcxnwmYRGG7Qy4M3RNCZU0aTW+0NVtocJaJSmw8P8+aolqnwmzG
         mho1yrTjZREPRgcePSHNq5u1HbckRqF6Vl1e0NnKm6auw2GlJ2mUy3/fjou2iDus8S0f
         wdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772599104; x=1773203904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
        b=J1Zm1evYjrR6SDniYYFd/3VLfm7kVzrSB3qidhX4hsQyHwzkeVvGVhbVd2pdYThz2k
         o2tLJR7b1fM7odObX3Hh3HSZpBDNWP6yCQnkZiSZlXJyVG2LhFv8zlgu3Uy2ctL3Pgkr
         mPOLwLf44+SN9KLdPKOfwqUVOVH3A+urzYK8hBrxF15bG6fGncKyv1bYv98c0Y0r4BrW
         mfj+MZJkKKVh8mCfrR2WBhHPoo4d/H+1Hdyk3u6ak++h+PQnsjk68F+ZdL4WLXhOGHEz
         o9Jx5gUaqBlyQbclkK/8491vEEdzYs251/cwAAy7O1aepFmMxM+vaU/n5lzCoKnghAVr
         CsBw==
X-Forwarded-Encrypted: i=1; AJvYcCUfByS1CdYs0aatv1gdsEaznnafiBXTnUKBxQnL3/qhC7RPBEJs0BkgKVbxA5U42VoFZKVSL8T1w6SRFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUpwcL6lpJXl04LF499VAqYawWScZHrjmBFPnXIk8XIuvBTPTF
	ZlUqFnEpMSyYEmeT1/KsD6iBz2pZXDuR+9IQMMAEV+4uDwwa94nRN9hxfLvA1bQCImv451co1JT
	R4I8g0MdTTQCJYlGOc6pWYLdw+joQwUHm6OS2HTbRMQ==
X-Gm-Gg: ATEYQzzKnaUqBCCf516GF+t+owUE8FnGo+qAoG/oz/ayzSHJ2P35hP98RQ6M8N4fNZL
	6GJtngGTo/kCEdq6vK6osudu4kvdb8soSbBKMQydsQEAAExOBOXv7Fg3Dnj875OW19MfCxTp7nU
	Eljegqo6luOKCP4TC2yeGNDOSu0jqJ/USc0F9wCbDuwNQ1Gy6OVqZOr5PATjAhnxUybc1wtKw0F
	lmca/f+9E7WpO+dfXMVKXxpDzUnnUpnNSlIJP30n3xnYBmf6tAjkPEaT8eZjirRr9r8RPNQmdmU
	8wI7gqzUhgEAGahedQ==
X-Received: by 2002:a05:6000:26cc:b0:439:bae9:6151 with SMTP id
 ffacd0b85a97d-439c80100b5mr1233744f8f.48.1772599103909; Tue, 03 Mar 2026
 20:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-3-95517393bcb2@linaro.org>
 <06249a9b825de30d1fc19fac873840ab3cd7f6aa.camel@linaro.org> <j46cw7ns2jvcojavsqw3f6se5zwjt6lfx7z5ahy56owtrwd27q@ufjrfwnfk453>
In-Reply-To: <j46cw7ns2jvcojavsqw3f6se5zwjt6lfx7z5ahy56owtrwd27q@ufjrfwnfk453>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 4 Mar 2026 04:38:11 +0000
X-Gm-Features: AaiRm51B2RI4RVd1gpKraSUcwk1_GGIfzTP-w_kfBb8uww1EVsubpX8PXY_AI10
Message-ID: <CACr-zFAZELW8rL2ui96G4nPDnmtxQ4X5Q47Ha4n1dF7iHcPHYw@mail.gmail.com>
Subject: Re: [PATCH v8 03/18] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: DA8BF1FAB6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54421-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

Hi Dmitry,

On Sat, 28 Feb 2026 at 07:17, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Fri, Feb 27, 2026 at 10:01:43PM +0000, Christopher Obbard wrote:
> > Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
>
> Christopher, please trim your messages. There is no point in having the
> whole original patch to be quoted if you are replying with an R-B.

Thanks for the hint, I will make sure to trim my replies in future.

Chris

