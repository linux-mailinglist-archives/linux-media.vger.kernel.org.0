Return-Path: <linux-media+bounces-33438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3C3AC4901
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 09:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 240A73BA88F
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 07:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803EC1F9A8B;
	Tue, 27 May 2025 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezGZBuKA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4FA1E231E
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329367; cv=none; b=tqkSSg5xaiWT3BLi6az+tnilPOJvQ0dCBV2TGreYzZkfDdP7EyNpWfSWhMd0CWYoAdSmP4OHbHq1N3ZCaBBQKpmJCY3OompBqoz0fSpgGKfMWoZb/tyoxw7UxkbtfIs3ro1rgtpvzcEJBlK9Po+X5f2kwL10UTS0+P8IoTwjMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329367; c=relaxed/simple;
	bh=ykMUu/xAiwJWA1N2dYNrn06XJfR0q/A0vlqJittn8KM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWCFAMBtpSfYVqC2eybRoQisILUwfDALvyy2b/YKdW2ZyxcEllS17A56UnzrdTBW175LrH+/Px/6kBTse+fbBcpdlXhw+gtsRTRcsdZYwaBUhfbi03MNO/o+Rs28WfvBXYM04YRZX0X4okwRhmvgUzR9HYxPi9DNAYtbnaaPD24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezGZBuKA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acacb8743a7so540551466b.1
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748329364; x=1748934164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/tqLqTldPv8FggkVwqL5yeiDZSFqHNF47IpVA4qBBE=;
        b=ezGZBuKA6XWOTztB0NV3EnuX/xA8QKlPn1EsGDlBVlQhUM5m1r3QFi/dDL//8jYh4G
         iG3G+ginMs0yBY68Sdpnxnlun5HJW7hO3sqx8w+ImdoY2AV5GGWMdjtc+3dnm7GR21Re
         +iMi6R5yNVWfmin7tsI9eD0YDfd2R7Nr44wjGOJGOFcECU4lzeJIat3TLzJESuq+FO4G
         GLKJN/v5+gYjWwIZLRue91eaI+Vz5BRc51JnhZiNn9Y06ODEyhjHn+wxUgQhlhxZMtZE
         zPNPfUFyjAVHvBMdM0OAvT3NJzWW9ci3fN1CeauAjsL8X90vqdo18H+zCZzmjb+HMrD4
         7VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329364; x=1748934164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/tqLqTldPv8FggkVwqL5yeiDZSFqHNF47IpVA4qBBE=;
        b=dU2X8yaCHfN15FepSkLKZKA4K8PLbO6rrTutmAgWp7+37u0ASWdmdSSd9Xq040Og6Z
         BCzFfGKVgfqmH+IetlEf97BfORlMb8ircyNBk8qyEdjN4IMv9sSLaaf/8CKMIFPZF5TE
         yi16gXAXrhK5Tn1ZSqcw2XIF/B2ZWDq0w9OxdTYc2p3RQ4T+87Lvp5aq53TF0/7eDJjL
         aA5YB3Lbc30qEltQ1UqmCz0TTktkBtArMvkD50NxvKWJHwjYUaeafV8IZEnaXcOwoeso
         4WoTMh8UnMmfhbIU+5q5ijyDaft//UGQR18QCt4dGijeNtAYfbkOYKyPRWveag1c3LDS
         RGQg==
X-Gm-Message-State: AOJu0YxSwqBcfrkWE+Y0H8SGsvBrbMCBWzrYNV7DgpUoRS1TjzWem/V3
	2pmK7Yw9EemLwm52BgnTKtIyKGG18r4Uj1Kv0rkhdGyNp5AwcEQ/ZKlJ
X-Gm-Gg: ASbGnctMaovdmAOvaDqgRkSC4qI6cjNDsKN0n52OqHIGeEJMKxWLhw/wSvXsdfGsn5L
	xnLBcH0opzns5ieiBZfCFMwAO53+3nEC3fES/dvyfK2KYmrevjMJgrMf2CnUnfd2p/QfNMphpS1
	QR5MQ612jYVvNrETiyxhucvElW0a9AxDaTD7Ptv+tPmjgq5utGmaXbmy5hexqK6HcbOB1ac7EHc
	unqf6HSVVP1QUrFxwA3DGz63k0QGzKgiKWxZAiisEUVkmp6xNdung6ZN0+5IszQN8Yqad/Ilaqz
	rTFVJjXhacpAO7OL1j1/AtAExMO0o8rURBIG6Kreyjql/LE=
X-Google-Smtp-Source: AGHT+IG2Diu69opQO0XpvjWF9TkFtx26YpR1UJQIhae8sFfOgtAOAniFIQewnGLpbTEFCrzF19Xs3A==
X-Received: by 2002:a17:907:96a8:b0:ad5:1d0c:1b90 with SMTP id a640c23a62f3a-ad859840efemr1133722566b.11.1748329364248;
        Tue, 27 May 2025 00:02:44 -0700 (PDT)
Received: from foz.lan ([95.90.158.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4d2323sm1819888266b.175.2025.05.27.00.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:02:43 -0700 (PDT)
Date: Tue, 27 May 2025 09:02:40 +0200
From: Mauro Carvalho Chehab <maurochehab@gmail.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [GIT PULL FOR 6.16] New camera sensor drivers
Message-ID: <20250527090240.511583ae@foz.lan>
In-Reply-To: <aBh7NzWRlLmqOIsa@valkosipuli.retiisi.eu>
References: <aBh7NzWRlLmqOIsa@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Sakari,

Em Mon, 5 May 2025 08:47:51 +0000
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Hans, Mauro,
> 
> Here are new drivers for SD VD55G1, ST VD56G3 and Omnivision OV02C10 camera
> sensors.

Next time, please place the new drivers at the e-mail subject, as I'm using
it as the basis to prepare upstream pull requests. E.g. something like:


	Subject: New sensor drivers: ST VD55G1 and VD56G3, OmniVision OV02C10

Regards,
Mauro

