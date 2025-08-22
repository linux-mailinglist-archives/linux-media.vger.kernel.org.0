Return-Path: <linux-media+bounces-40788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3DEB31F65
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 17:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7267BB47E0C
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 15:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FE833CE8A;
	Fri, 22 Aug 2025 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh5dA6AW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD63F27F170;
	Fri, 22 Aug 2025 15:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755876934; cv=none; b=F+bfRWg8qU7j1BqccT6WRCnr9oVaOPOo3ZhZo1YOCoZT37VkeRgkNudVPwPYkMMj6pG9iNB2c8r4sVN92+HBWZ1boo6cIngWbMl1XobutJnrDk5z7ylkl8ySSMOxWFPSEsDCVEsYlEjpiRxRsx7DBlIKk0HEGFwH2yc+47Sv4t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755876934; c=relaxed/simple;
	bh=7HIBoM6YPKh/LTGarj653O1hKfmtF9V78V7iZvI1uqo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=BilbVy1khhjNcV1uLsD5y9kbg94ncEaLiHUCnsCM4S5r6BtLipScPIGDwjWxIBgkA6fxQIp1odZJ3krp/vve8cDA3+bJi/jRo0aU2Lt6KTfUO+dbNvehH8WAAMw7EdeUd9HPb+bpYw0rRsqx5XLXgqXrEd1pmYccQAzuJci1yCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh5dA6AW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-32326e5f0bfso1854756a91.3;
        Fri, 22 Aug 2025 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755876932; x=1756481732; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HIBoM6YPKh/LTGarj653O1hKfmtF9V78V7iZvI1uqo=;
        b=Zh5dA6AWvN39QdTl8fQsvFHBnMxuCNa1C84BKlcnh06LY7uWCQoHghXcMJBOfA3r20
         HRFdPuEPqPqzXd0j98LfWz7IqyKFA0ClZ1feGN90KT1DP1fiOLU+nzA2Fd5Jr1l6b1Bf
         x52NGn9Jj+TNJ99ipMhJMP0/2BKyVFjspSV4xi0dfoJz7w/x3wGP0j8L3XAhFf8qDtIC
         fhZAwX80NGDYIqY7KxL27USOYU0htb5uuZIKpjz/BJcsh8tXr4S4LLN5iDWfTd4/aL3Q
         x1cz4RiIe0z2eJUHY4wgf2L862xqM9vRC/30QnGVhhBXcfn123XYj48mzmvq/W8JH1Il
         fk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755876932; x=1756481732;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HIBoM6YPKh/LTGarj653O1hKfmtF9V78V7iZvI1uqo=;
        b=KaFec29iGiBN2SThEnw3O5MMhX2v3+aFxNaTzQY96saJBYQb1zhbNPbymdV+wGH8Wh
         2Fczdx4xlOLtjRcxiF/3Q1lUI3149ZvLdGg+DsqZC1hb47/FaPORC2mlm80mGZni4/nX
         L705NsJCDK99p0obDkFw6Xf0rIXTpY7jNmpPcM/JlQPww7sLi04HxEM+X/uqe4gMgPUh
         Odj1vbA1alfvrYH2iwzvo+7vlw7NgxmiMm4ys9niWeuZ21UtAR617h1tqTfyGYyACZXT
         A+B+liFfIVFyywrSuVJV4tQe3WcUaDMxFgqU5qLhyjb4myLvMe5mT1NPjhK9pZIpAsD1
         MiWA==
X-Forwarded-Encrypted: i=1; AJvYcCV81JkKugHaBFwg3gPEt79uipXXd7wSNEnPMIQsM4tVLffLB/zMnyhaZb33RQaFO9mYlWpi+eps/iMSRDE=@vger.kernel.org, AJvYcCWIzDeWq6SH1sSFB3yoAlO+YeUyo8MRaAx2uBpxmSwaTTmWYKzO+tsZVbqrMmybd7HEd8Xgtpm+tuEaxgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTAwtXqJ6Ev4Q2Jibuft2btDR2wTzPM3CPT0rMp05joI8ommh
	P4HM77V2hTV/WgyHpi8Hs9R2r67tsHXuZSp2CdPBJSGhUf0YW0Yk8H7RQbp+xQ==
X-Gm-Gg: ASbGncs8TKalCVaNB6mKQXt/dVidg8ALsSfBqcOP3pRJvbqYjzf9h+XQgmi2nZRC4PT
	4KNvYKpQzn7vP2yrwucu9BKGTvqihCe9RFVkAyxHAYurZNX3xn4p9sC5xZEbTvlpw9d3wPJUiI9
	82ySSSLy7Qgoco35Gaja/D/drp1fYP+TbbyBvMwr0WY/PTzCla3RwFeUqW27BrMd3V6GdLt71Qq
	b6Mn8k+x6TLR4fY80OwJaI/EweKsu0aXOOLQPBs3mRFLCU1h/JByoKD/pbu/82xUznVXyKTiP1H
	dwj/2LbsXiM7JSFZF2dxhSBQG+n+Q2KfYKEsSvH6GmbqKsnDGL4jkQ/NybtvI0qKNPv7uLC+1PL
	Jy+qUrhhc51AzFkPOLIkM4A8VWtxki/WoBRQir+Qeota0Ls6mBVw=
X-Google-Smtp-Source: AGHT+IGhRlCu4au45nKNxRrdnkIkZJOf54sg/xTNdaAquWR0Lsp29n+ssVOdGi5ldxjhXFuAdv8PzA==
X-Received: by 2002:a17:90b:2b4c:b0:323:7e7f:b8f3 with SMTP id 98e67ed59e1d1-32518b80c13mr4814351a91.36.1755876931976;
        Fri, 22 Aug 2025 08:35:31 -0700 (PDT)
Received: from smtpclient.apple ([2804:7f1:c242:a307:7992:d717:bc22:e8df])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254aa6478esm213274a91.21.2025.08.22.08.35.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Aug 2025 08:35:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] media: vidtv: fix to initialize local pointers upon
 transfer of memory ownership
From: Daniel Almeida <dwlsalmeida@gmail.com>
In-Reply-To: <CAO9qdTH=7qdR2KGQiAeKu11g8T9pPjYN0zjarLGGW_EPQ_nZ3w@mail.gmail.com>
Date: Fri, 22 Aug 2025 12:35:18 -0300
Cc: mchehab@kernel.org,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <31DCB1A0-22E8-4CBB-99B3-9392EB10CE13@gmail.com>
References: <20250822065849.1145572-1-aha310510@gmail.com>
 <7FD2157E-6F0B-40E0-9984-7485845DAC51@gmail.com>
 <CAO9qdTH=7qdR2KGQiAeKu11g8T9pPjYN0zjarLGGW_EPQ_nZ3w@mail.gmail.com>
To: Jeongjun Park <aha310510@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)

[=E2=80=A6]

>>> --
>>=20
>> The patch itself is ok, thanks a lot, however:
>>=20
>>> media: vidtv: fix to initialize local pointers upon transfer of =
memory ownership
>>=20
>> Can you please use imperative voice here? i.e.:
>>=20
>> "media: vidtv: initialize local pointers upon transfer of memory =
ownership=E2=80=9D
>=20
> If I do that, the patch subject will change. Should I just change the
> subject and send it to you, or should I also send it with the v2 tag
> included?

Just change the subject and send it to the list with the v2 tag.

Also, I just realize that you should rewrite this further: =E2=80=9CSet =
local
pointers to NULL upon transfer of memory ownership=E2=80=9D or something =
around
these lines.

=E2=80=94 Daniel

>=20
>>=20
>> =E2=80=94 Daniel
>=20
> Regards,
> Jeongjun Park



