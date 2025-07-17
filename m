Return-Path: <linux-media+bounces-38038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 912FCB0968B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 23:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFD17172B8B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 21:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1922236A8B;
	Thu, 17 Jul 2025 21:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVNkdfxM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5AF2AEF5;
	Thu, 17 Jul 2025 21:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752789074; cv=none; b=QvkhPtjGFX4f2akF3ZJTehppDxCUvJ3R0/X5RJbRqtqBMbtk+m/ejfJfxFZ2PgeKYGI7DK6abzDalTmOOECZHATFZgEm5okr1/q3Q89lfVYzvTL7Z3BkzlUsjmMUeq8HHLIwerOfMK85itA6SejzjPBabognjuW4hRIqnS5Kq6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752789074; c=relaxed/simple;
	bh=oOWr4ukU5PJD++6oIlebvobAFIIflmjDpDbAzZI/eRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWXFQymzJAXcAM4uN4dvdjlGJlcvaPfHQA+dQc8BPfn+6xm+GRyWc8U/L7t4/dVVpApSdtN1J+dpxYzKyN4ab7axlY3hAhsb+Zbty0F/fMwzryPlMDYMEl9YYSkMJc9/1oDVzHifCM84jb1f7HAJiiZOX9dkXiPwEfPnQum3X4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVNkdfxM; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3df2ccbb895so12016795ab.3;
        Thu, 17 Jul 2025 14:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752789072; x=1753393872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JwEr190bn3CteNx9maLuZ9baHoXlN9SDnSLVnDufmWU=;
        b=eVNkdfxMeEOSlxK3MNMuZdmY0pHQC+hLvnTDNe4zo0gpR3QngRR+Ej3UOSk76+Pn63
         42zehzcjJCZ6w+BYC5vyk7rYVBurCVVdVB3UIAzZQzfQ/hIDPBdkJ8DWgmqEBnWh179s
         rrrr8Batdyt0/oi11Um0RPJpMSsqjqsUIlB0JXJ9OFeRFvs/mhO2A6Si/iJQo6W9dpqO
         XALfNu8cMXFMb3W1b7MWZhRQSu+hVDM1m9SEav1eDulj0NGmJhnU+JEhB0KWQdu/NlKV
         CjELvrQMkOAWDLJsKm51Xz+7C7S7cWxDSXRCYxvWHTE85d0gz9EuckC3qY0D/RTvEhd9
         JFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752789072; x=1753393872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwEr190bn3CteNx9maLuZ9baHoXlN9SDnSLVnDufmWU=;
        b=m+ZpvMmCQc7/HPvZa0Gk9jE5kftPEyxsmGLo22IqNIiEzxK34hiRECxBcZdzP8RuWF
         6AQW2O4uzhPmx/1jIfSTV1UMElaOyCDjgx/rURQt9IchLeZ6NgMNXFoxBECNwsNFW0RB
         4Hz7KbTiDIdIQvgKkETQjXAfSSdfTXfLJJbPkgjgnuCmoWKivDzyCgnW/J41MfbMWl7Z
         lEAlwLSLOfZrjEXBDY6naoi7SlY3lp71LNCYXULUaczgcsH7pMzXwDzmygk9sFXTIW4T
         YU4ZNFsR07PH7zQYMb7XZsxpJSQK2aVmtkgfAr9pF0Y2nnD0m+Wbejze7xcOhzTD1qvc
         YvYw==
X-Forwarded-Encrypted: i=1; AJvYcCUunpzdTTkNbIiWXigmWI9oVUK1c++6S3wLS/U/uMOdU4HREZQkgCjVPZNTnukR6EH1evtteTLmIWp/2LZE6w==@vger.kernel.org, AJvYcCV4qY6z0eGbwAtSywCpNxNP3eiunjdt5MBJTO+/uvQslUF40Eun6D/ioEpS8SPbewmKi7hBDVxkuMyEaEY=@vger.kernel.org, AJvYcCWss6F+zbgy6NAOObFmQFrHkM04ekS6+oB86rMg8hHBhigDqtu7VQWy/fQB0SLbuvPtAr873z+EoM9K@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9svZbf0ofgIUlpLuZrhpZt47T6hSv2eglv8nZFqlL0XJmadu4
	Xq2RB606l3g3Ynrx4h1I9L5wwnbVuViknO188xtiIKXj22DeImeR0QUp
X-Gm-Gg: ASbGncsyDPFJF00vzpFYVH2lgUvmDr7zq//6pNyDxVdopoNAezxD9WXlDzG49Jbr9PQ
	m23tsm1FDxeT+Z3A2xtIswF1tTcx1cfb6P7qIdaq3D1PXTiSF2DuUOA+xbD4SsFl2txyp4VmsVL
	EZ3mcmVnZNPiIRDcROdFZbjxecZXgNPy0x8bDYDyUuiCWe3xvP/mEajnN3bwxRN/Jz9uWAMpb8g
	+NIgnPWGDavV/U5YhAV1SB8m0wreDlBGh2Q5dS+/TySmH8wW+MyqyJWSKefNKZNqQLcy6Lstcuo
	vIhJWKA3CSgh2fh2SVyCydUyMKwWtkC6nNLz4HI+RdgW0lqZDa/cnh1Hg+m9vU+oLHc96apbWrQ
	+NPgHPkyWHQ==
X-Google-Smtp-Source: AGHT+IHLz8eSQTN5I2mnc0iUe1p7CE0wpjlhUhji3VSAfmVRV82d8nh3iz+yOuT2ujX4uVN0NnaPfw==
X-Received: by 2002:a05:6e02:3981:b0:3df:399d:39c9 with SMTP id e9e14a558f8ab-3e282d62656mr96197705ab.2.1752789071654;
        Thu, 17 Jul 2025 14:51:11 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::9bde])
        by smtp.gmail.com with UTF8SMTPSA id 8926c6da1cb9f-50556b0f297sm3719291173.122.2025.07.17.14.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 14:51:11 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:51:08 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aHlwTEdPGq43PGqo@radian>
References: <20250714210227.714841-6-mailingradian@gmail.com>
 <20250714210227.714841-7-mailingradian@gmail.com>
 <20250715-quick-misty-rottweiler-9ae7f7@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-quick-misty-rottweiler-9ae7f7@krzk-bin>

On Tue, Jul 15, 2025 at 10:27:54AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jul 14, 2025 at 05:02:29PM -0400, Richard Acayan wrote:
(snip)
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> 
> Still missing supplies. Hardware cannot operate without power. Please
> check your datasheet which will describe which supplies are optional.

Maybe I shouldn't have pretended to have docs when changing the
supply names, but I don't know which ones are optional.

I'd assume at least dovdd/VIO is required.

