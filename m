Return-Path: <linux-media+bounces-5721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D173C8603CC
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 21:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B821B23AC7
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 20:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7B471739;
	Thu, 22 Feb 2024 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="CVgTCISm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270465491B
	for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 20:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708634562; cv=none; b=e450zNHEzABJK2wDkNIVcTHyVc3WPVYwyoAo59Nu5H4THMzYe8nPtp2t7lqtWumyGZ1vGlXpvY+JUiBVH5GRa4ICf37Z20kYBUBkJdi/N8U+vMFgJHMxVGxqGIXHbI5y5ENjgwf6JROvbCE5KcxAMyjXYLrUYBW4/1lVybExCaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708634562; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sgxbWVOG9zVsbelkUnIXoXdx945A9o0AHpkh2DHbXurJ0K2bB6TdSAaC8bu5gqkhL3k4/y1hppPz/HWcHK9jcZ2mqgcYxHaTp7Ci5pyzMDlVJ5HScBuGgbXBFEkDl8ZDe7YEh2E9f0jJUyoqCajo/h1iGwsN2uhSgIW38iG2sho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=CVgTCISm; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c167e503b4so47638b6e.2
        for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 12:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708634560; x=1709239360; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=CVgTCISm+rXpzB1ABIl01MPLGf83BQj+QTjlI5Ybs60xZGAw5Jl1PAr7sOyedD1bdf
         jF+Nf1EbT12TT8UiN4YC4pp7IxeeSe8exHqUAaGvZxsCq5QZtW235AzsLJIgvK2XTNOE
         GfThfI3pKVbnYodIKtFAIPaSHAT16464w3wRYn0wL6ykI+vVoQ490No4hnavKLuOjEGM
         tLf/S5qOSZiOwJ3NmZ2C21szEN2Rw5Rr6MFDUuhHh15OhGNWlIrplGbUSqJaHbmYA3bW
         NbDE157FXwzGqxhvL1MC5smeru5yl1OgtjeQToETPGmafUkBvQ/6/JQCZaMYF1PT6Eg4
         XOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708634560; x=1709239360;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=gWKPuzHBq7Cctdqs7IFnTidVsDTU4CnoqJL1vN2fApfCUWLyY02GWJYeNdBU7ZagKM
         LOU7mLT+ato/xy+cYu6rgx4VkTFrbIlzJ7HKyffPpHPw3yPbvqfLc79CmYwZcc5JLY4V
         iqgmsGTgMgIyRK6vwbkqM8O4GzZ6nNmEG5kDhcVwkBg+qgVQdE/NjBSTdeEqSlmBqDuF
         rPnmMnKPM35rad1kfvp4OskqEVDDP4V+u5Sm9G49+4X3EkcyHN/DLvjjPfz2rveeBut5
         OpM7de1VJu33zdgIyN2aoPc/JIpKzcjC/8VZVwQxJCZFmnRKNNyIAK6EMr13GApiRC1L
         7uyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeDGcZtlg0rvOeUaKG37QbUjFvx9EyJrIB00BbXpaQSEzPQZElo7mw3jQJCq4rnsSXcouCYqMasleQkiR+ej/IPpWH8Ue55Iy61N8=
X-Gm-Message-State: AOJu0Yww3zvhacg+KMM/gjb/7z8S+S9ufa1dPPeg7IBkX8M5VhlnjOHV
	TLiVt8NChgZurl8GJi+qgIasPveII4svm1Re8YSf+gFYo+wDh8vzXh0QdpSb8ro=
X-Google-Smtp-Source: AGHT+IEZVu3QF2Lct+DILqGBam3Eoked3uTGhzoLwKep8/Hcwcgw3Sd4rKr/sqJVtcgcGZEagSWV6Q==
X-Received: by 2002:a54:4097:0:b0:3c1:5c93:7e55 with SMTP id i23-20020a544097000000b003c15c937e55mr41281oii.19.1708634560232;
        Thu, 22 Feb 2024 12:42:40 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id od15-20020a0562142f0f00b0068f752195b5sm4881524qvb.86.2024.02.22.12.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:42:39 -0800 (PST)
Message-ID: <5d351e8641f7d1328955b98450a4be9f53a7388d.camel@ndufresne.ca>
Subject: Re: [RESEND PATCH v0 3/5] wave5 : Support runtime suspend/resume.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"
	 <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	 <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>
Cc: "lafley.kim" <lafley.kim@chipsnmedia.com>, "b-brnich@ti.com"
	 <b-brnich@ti.com>
Date: Thu, 22 Feb 2024 15:42:39 -0500
In-Reply-To: <SE1P216MB13038F3890F8B4597465B394ED562@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
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



