Return-Path: <linux-media+bounces-23676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F89F5A4D
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 00:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB332164AFB
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 23:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10CC1F8F10;
	Tue, 17 Dec 2024 23:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfUHe6oQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA221F9A8D;
	Tue, 17 Dec 2024 23:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734477615; cv=none; b=p7mPpSTzkxhdYCw1MPlnzRc90djQVAprE3fCKmdTFMtEEEGo3XlZT9xtreKb07RcFjWmF3uR04ABMC7q7C4zS5mpc04WYgYvuL7c1b/hc0sfkQe2AxewbKbkxwCuOJUX5DDRvCHDIWCMYfceIKnOCdtC1LsihcgULCWxbvU8ZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734477615; c=relaxed/simple;
	bh=JqIV6tXx8tIAUlYAP5uzDfLYcpL3NO3HNC+91AQV5v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUrjRGBS/NpJGkXsEZaJgcgCDwQ4i52wjNwMuCLOwM7NGkmDIPnNcVTauB10kWFjvUz22mK2zNWn+wt+8kr+5vVQ7c3LE/aX8CNSOTY8y4JqXxuZowkvOOXpoN9GITWviKfi+byhYPbhXv918hmdcp175WgkG+FsFGM5oSVu3QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfUHe6oQ; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a9cb667783so47216555ab.1;
        Tue, 17 Dec 2024 15:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734477613; x=1735082413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a2ut+U+UFksY9pjpmXdvSwGsV7tGa9RTGHAwPiDCRYc=;
        b=FfUHe6oQQ5YqWRzI2PJcwZzaqjbZvQdWPAhyJ34nF4jHEfSC7UGX5lRczcPgow4tPq
         A5Umzl68h8Fy08tV/6mjA7v0ADKr8R0rFkl0bY+vvQZoUiJ+R7RDYjjbpFNQaMUfYuTh
         XFLohVUfBy3YxPWW0QKLFVv1o6tau72Tx8scW1tSZxX9iQiKNz4bDHwbuMyxsmRPjlv0
         elXhSBf+rifAFWnSo2c0+dscyBHnIUujKENfZbPnWcF5Pi053CvChCg4oLryMeYnh0hO
         GHxSIzyt2PSXT/ywPHS4+/p8uo0X/nDA0rPShBw3B2DIr1Tja4aaw1ggl2MbxMGVjq4B
         0hgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734477613; x=1735082413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2ut+U+UFksY9pjpmXdvSwGsV7tGa9RTGHAwPiDCRYc=;
        b=Pm5ncC9jXLV7eZwvKMaGGHJNT8UeK0/0f+N1fWUtXwjVph/ZRGgZBOwU1Rzm9+BSYh
         9A/WPKndZFZ4WrU5vZwrgMlisWP9t8zUrQ/F8N3ZYLSyZ+Rnqe9RR7FQvNQEXuaWgDkO
         ue7mPwCscFt9YspwEcP5TFoW+NktjqxfiCBbtliM2VuFliUMmd5elwQ642ERSPpI6h95
         PrlGUiTMY1lwWo4c6LI/FGm/5RK1sEMV7WEBvXfUo4ctpijKGCHD4xSQ4ST7veMBroTH
         EKCOWH3UeTpKmYbNomP/kLXIcwoFiyFnYfuqGiyCgjAv/ulUu7tpDudJh2WUG07jSK07
         md+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPS7mbHIUpVg80eqVUUnbGhx0JHRNDga1OWf3Q7tee7afXRJKYr9ahwxOATYM+h2m/BBmC4LYXHQZCj/uoEQ==@vger.kernel.org, AJvYcCW4er+QMikF244N4PoDHlpI+X6Ue5hnqGzu2/CSZ0v6W0QTe2MGd7GH9SuZg4JG1I9tmfFRjZ6j4ss7@vger.kernel.org, AJvYcCXM8nBxM3ZewgmhfRZMn4zgzDYcBLXZ3b3CORBpmNst1yD7bCCp8bU+w5AqI+xl55kJ5TbhawSjNng3@vger.kernel.org, AJvYcCXmcg1o2375bDVhM9I/f+1/RCuyV1pz9CgwNkz5QP/E+7pM8a1cwxgX/flvMI7KXqp7YbO8ZIBit1LRUmU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysv4O7OwyrUr4WTJmIRkQAv75YNNbVJk/ik6zPh4l7nuMvBr0/
	L0uHmOiDkOMFbgv/NHYbAd2L7nSldBfj3wU6nhc6kreYQ7IyhNgyitDymu5A
X-Gm-Gg: ASbGncsyXq4QWCF7BuHx2Fz2mOJrvb/Ykqv+D1JpjrsC3jakb2L0+VjGuLuigu5ej+D
	m9NbNWlUpnmSQa8P2MGer12tLMj9OmhhkUxDD8uoOwNM2rdTuys7RVKiOsELBgwmXFOyU+KU1Mo
	Zqa1wcV3g4U/QOvjfzZoOLCeScOiq8QUE8wVhfufIeO7PzA5bqeotc/YJY9Rpr/Agjwo849PAPa
	y0up40IdKUSELAtdh4bvDqxYql2oLTMH2Xi13Us65/C
X-Google-Smtp-Source: AGHT+IGNIqbtCEhBg7W6GvXfekFWUVhfGw5JTDt8DThOAxcDwQhAhCFshh5Q0pPoYbNanyOf+10IPw==
X-Received: by 2002:a05:6e02:1c26:b0:3a7:e83c:2d10 with SMTP id e9e14a558f8ab-3bdc4f186eemr7183255ab.24.1734477613056;
        Tue, 17 Dec 2024 15:20:13 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::b824])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3b24d7e4e5fsm23163055ab.65.2024.12.17.15.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 15:20:12 -0800 (PST)
Date: Tue, 17 Dec 2024 18:20:09 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v8 3/5] media: qcom: camss: add support for SDM670 camss
Message-ID: <Z2IHKbvVw2jyap4E@radian>
References: <20241216223019.70155-8-mailingradian@gmail.com>
 <20241216223019.70155-11-mailingradian@gmail.com>
 <56f606b8-35cc-4bbd-af39-106277530928@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56f606b8-35cc-4bbd-af39-106277530928@linaro.org>

On Mon, Dec 16, 2024 at 10:41:52PM +0000, Bryan O'Donoghue wrote:
> On 16/12/2024 22:30, Richard Acayan wrote:
> >   .../bindings/media/qcom,sdm670-camss.yaml     |  72 +++----
> >   drivers/media/platform/qcom/camss/camss.c     | 191 ++++++++++++++++++
> >   2 files changed, 227 insertions(+), 36 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> > index f8701a8d27fe..892412fb68a9 100644
> > --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> > +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> > @@ -31,21 +31,6 @@ properties:
> >         - const: vfe1
> >         - const: vfe_lite
> > -  interrupts:
> > -    maxItems: 9
> 
> I think you've had an error squashing some patches.

Yeah, copy-paste error... best to revert the change (and change back DTS).

