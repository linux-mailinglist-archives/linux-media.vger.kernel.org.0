Return-Path: <linux-media+bounces-5722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F270860410
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 21:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D4321C23604
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 20:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF5171752;
	Thu, 22 Feb 2024 20:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="CyiObIsu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CEC6E5F1
	for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708635341; cv=none; b=pT4E7uU9BWxQzX+AhKq/+l+X6Xxfc8Nf/56jxRP1phAuby+jnMz3Yj1aOvmaOkFeCjf9SMcFQLi/BLnsig5bNbOhjmrp+X92o2jryavvqRnIHL/ps6vi43c2Y7/y4vxKlczf3uFcj+35TkeBOFScjEp0NpXtRtiR7kYyQfjxLBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708635341; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N7/gmyVNGBQ4Qy/iPmRC4d4aerUvT7UjgkS/WBVm7N8s/dTPKBbKpF4Oirtg+XjzpB6NbGjmvViY3PN7McivBMHDdo40nb/+6AdIPqPfVFJP2Eyz1d7HB//M46MYDHbxfmAzq0h70qZGfQioKbeZTBunADC6WJAXo4om81HsP7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=CyiObIsu; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-42e5e1643adso273161cf.3
        for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 12:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708635339; x=1709240139; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=CyiObIsutKmXk9m0vYgmFEQWXlHSz5c+OYwNSEooQG3hV7ozSngUYJLxnz70mgYpPk
         exyUUKMssNsHQYbmm0Yjj5vRlo5jXW4afVznZtHrlFB423UN1sQiF96jrXc0s6eecuyo
         UdChsBzSs+wx+XuDN2SRh9AprQDoAVRk326Wg+YusDG2jPfQtuwfW8/dybT5qbA/PyGY
         Y23jkQfH6rKuGe8o2khRP+R/gk3kzM6n8L1tIlFrRCq+B36cnU6oZitztrhyAvOub42c
         peExYGDhN/oJgfP67CzkOzeAVEkRTZ2mSe8Uhkp4RkDU+bv5TWiQi9s9BRsCqoEJcwM7
         YALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708635339; x=1709240139;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=q3pbNrhnpx4Lap3UWM0h6rpy46nbVdxSGOzKH1ykQfhsCMoMHrfwVsG1IZWgXkhBu4
         B3tr3GWshztK6gK9K104atMkcHCV+k7q/1eSUAkiln3OUDnvuHJndbdfpfhf98Pehp3A
         BfRDMTtld3ZTZ6YCESAO4cTFN4rprVoztErD3Gk4LJaoSk+A9torGBV9Db5R0W4c2eT1
         fA34V44BCP/PAPjD/XzBgH1yp2A1Hq1mr669OFUlSD9gmUOREgncMufVGrZgyTqQ3gxy
         QnxlkuxZ7h85hLgwcKbCUsrNkLLzeDDLzAk44FGCZboOGUUjC42WPk/DelZ4KZ2ahJHa
         uj8g==
X-Forwarded-Encrypted: i=1; AJvYcCUtkuNalT6P7NCpvYaEtkz4va0naYkAvH/iawTs5jxT8mdq1yq/LNRpurFCYTcAgHTXKsFxuz/ctFnIE/KurQuET4hhg2GtqyKAJqc=
X-Gm-Message-State: AOJu0YwKAVDbFRVahyAwZCEPEEOJtmrkvTE7JTgfjFK3q6lwYeO6ysbH
	/CyZ/JO9ToDrk7gQna5CilB/9Dq0k+q2MaVEMh9QpIaFMnBwX43yEku88gm2918=
X-Google-Smtp-Source: AGHT+IGz7efUDBoB0wqIYpaEHPilx8wtYz0FfrG3iJdyZ1CuQZCDnwAB6jiMBBlW1BnHYPOMLjuO3g==
X-Received: by 2002:a05:622a:10a:b0:42d:dd39:355c with SMTP id u10-20020a05622a010a00b0042ddd39355cmr379415qtw.4.1708635338807;
        Thu, 22 Feb 2024 12:55:38 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id q18-20020ac87352000000b0042e0620d2afsm4577379qtp.72.2024.02.22.12.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:55:38 -0800 (PST)
Message-ID: <060d634c4c707c9ed93f0d97816407b0195daace.camel@ndufresne.ca>
Subject: Re: [RESEND PATCH v0 3/5] wave5 : Support runtime suspend/resume.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"
	 <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	 <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>
Cc: "lafley.kim" <lafley.kim@chipsnmedia.com>, "b-brnich@ti.com"
	 <b-brnich@ti.com>
Date: Thu, 22 Feb 2024 15:55:37 -0500
In-Reply-To: <SE1P216MB13035B8E53454881C87059B9ED562@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240131013046.15687-1-jackson.lee@chipsnmedia.com>
	 <20240131013046.15687-4-jackson.lee@chipsnmedia.com>
	 <efe24b949a60034bf618eb3b8a8ba82e8a5dc99c.camel@ndufresne.ca>
	 <SE1P216MB130326E2C4BA7E723A8955C9ED512@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <20489b01f1ac9ab3e434ea4c17b4e0ccd84afa36.camel@ndufresne.ca>
	 <SE1P216MB1303CEEF6DFAB5FA7C69D645ED502@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <d5546b48ea829316a8dbd2ecc27bbf05e70e8188.camel@ndufresne.ca>
	 <SE1P216MB1303932A0D3FC399179115D9ED572@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <be5ce95b023bcff24f53fdae55763bf4a3f6b1d7.camel@ndufresne.ca>
	 <SE1P216MB13038F3890F8B4597465B394ED562@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <SE1P216MB13035B8E53454881C87059B9ED562@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



