Return-Path: <linux-media+bounces-30748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28903A97859
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 23:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 652CF176C51
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB91A29CB50;
	Tue, 22 Apr 2025 21:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="fkGqwW1l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCACB1E990E
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 21:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356614; cv=none; b=mcC8dcJorNKEWEV1EKq7O8zSFWie3aRQ5ZIQJxSpFH8Hq71cHeo0dS3BIHLJMLgj+IyDUUS+7rsuoeRceZMLFHOKZP0DRJmDtHwkjdDoYGjqXLWt5PUKFV7J1xs2Q67gfRAsRnUY5+y62HdddTXDpVDYWK5+Osya1Xr9Z1O7NRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356614; c=relaxed/simple;
	bh=+m0+rZaMUVhx55kLzsDbefp3yOwpOWuZ/8QI1r3dduA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YtqnBkNJN2KQa11plRmCcbG1gH+BNmFTVm5h6IAAGELt0BmOaexVM3DC0x+f3KZqPSsmWMfz9LxzbAQGHAkKpEa5Vsl75CXT7D6L+YtjbcGmyhZ1TM2Ys2Ve2XvAtyjhK1VTVTeJCUEhXRkJv9KU+Bgxtlwz0CC85RH22qNOsXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=fkGqwW1l; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c08fc20194so323281285a.2
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 14:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745356612; x=1745961412; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+m0+rZaMUVhx55kLzsDbefp3yOwpOWuZ/8QI1r3dduA=;
        b=fkGqwW1lubqk6OOyqkEYtzy5ew5RKHH+XAr7AIeJxJZVOtDR1fLjUm9yMBNoL8aBgW
         F9lggnX6fX3GMfphgKfZwupC6tAlbd8Si8s3gbyfEJw0PcZCTz5UM6StyCLgbX7OGNHX
         5N/8+mi+cfvyrrkIbOe6JdeaZV27zqTzoFgqgT6jNQqhJLhuDgve5uhEz2C0oOgLgFSc
         7Fdggj/hYsTcYAZKVny2xRyOOv0gPqxnXNWpcsA51kBshSifFNlDmTWrdOPh5IpTA6bT
         tH/C0dsYjGvq9HUJ9DEvO25Js9DpMfA0zquqTPy6Mm9PcHwZbaNOfot2sDQuldYje8om
         yzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356612; x=1745961412;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+m0+rZaMUVhx55kLzsDbefp3yOwpOWuZ/8QI1r3dduA=;
        b=va1uLQHlb4WUSBTKRjT5Z0SK61T3ubvgegoHB13jtMwKmcdh2XakuUETxd1Mgx847S
         krstxrJ6aEPFVnIyABw8zuXe1vY/LW+3GHA/4NJe/EQ3TvN8FwOEeU2oTS7M3HpqDpfj
         kFjyi5zwmAb9V1XXRa/+aMAP2ysRMFGbbChmWWn9e30lxeSPcmVhzNrHGwAs2tHvwEvU
         wblwDG+Oqby/djq9eEYt0ZblJR52vdBQXkWVcBq3k86vtBZzIqBJKVvT5AzsjqohS4+i
         ZcQPPMZcrgXa7bxdZQ3NN6QvRuY1Vp4/y4MeRnTh9Tv0N0QOCwewUVkXXgHnr9tng3Rx
         /0BA==
X-Forwarded-Encrypted: i=1; AJvYcCXR9sM7O/XlL5m3rgWzfzFjyGPVKZIXCA3/f8H9ZcutRu5B5owk21/o6lJ4eFqlQjGR870BsLD7042TaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcGLOmQ/oW26dO0BW9ME+eeacCvYWhl4wDDZ3buH1A/8suS57
	4jfyr8b4JNPxxOPPHSoAC3/GbeE805XRl1WTstZNiURY6KW0K+o/qNDqE0HgS0w=
X-Gm-Gg: ASbGncuCEy8XoR7oYP9Z3Jfawwc80ogmg2dR+UVrPw2nkmU4smJGn24ne8HLRlbWlnK
	CtEXhC908ezVxWyDYO+TtwCBDs5jWlGEANib2YimlmWJxC1AO78450R24k/ceVMfQWUQBmyWw/X
	/2td1VHbJkiQZkfPUl5nkxZKrqhJWobtOo6iuUtVe3D0wMehodrgTNEyJG/vnYbGPNtz8fvpG0P
	j89LK2mAMvcBeHBYYXtmRO+gHMc2JKOD5CTsOkUJY1xRVMMAntDb61pMEPi1oHYfqS+11b0i2tH
	Fe5juRkGg0Q+z4UEWp98w/+wGo3FkB3iHYEawxvtmfTlLA==
X-Google-Smtp-Source: AGHT+IFlVYwQrlKP3gWhwX7NhLyudB3xEPPmGML846D2Ka5x+PhwfULA1XTH/jRLhi8F5/suU+o3Hw==
X-Received: by 2002:a05:620a:1929:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7c927f59484mr2864605185a.4.1745356611750;
        Tue, 22 Apr 2025 14:16:51 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8bf65sm601475485a.25.2025.04.22.14.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:16:51 -0700 (PDT)
Message-ID: <b24a722c7d41eeddc02b81226132aa55d7a82bf3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: fix potential NULL deref in
 vpu_core_parse_dt()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Markus Elfring <Markus.Elfring@web.de>, Chenyuan Yang
 <chenyuan0y@gmail.com>, 	linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Charles Han
 <hanchunchao@inspur.com>,  Hans Verkuil <hverkuil@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Ming Qian <ming.qian@nxp.com>, 
 Shijie Qin <shijie.qin@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>
Date: Tue, 22 Apr 2025 17:16:50 -0400
In-Reply-To: <23cfd97e-b520-4e9c-a193-e0fdc885e299@web.de>
References: <20250411184356.2910366-1-chenyuan0y@gmail.com>
	 <23cfd97e-b520-4e9c-a193-e0fdc885e299@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Markus,

Le samedi 12 avril 2025 =C3=A0 17:15 +0200, Markus Elfring a =C3=A9crit=C2=
=A0:
> > The result of memremap() may be NULL on failure, leading to a null
> > dereference in the subsequent memset(). Add explicit checks after
> > each memremap() call: if the firmware region fails to map, return
> > immediately; if the RPC region fails, unmap the firmware window before
> > returning.
>=20
> * Do you propose to complete the error handling?
>=20
> * Can any other summary phrase variant become more desirable accordingly?

That could equally be a machine replying. I'm happy to get help with
reviews, but his isn't useful. It simply confuses the least experienced
submitters.

>=20
> * Please avoid duplicate source code (also for corresponding exception ha=
ndling).

This type of comment only make sense inline, there is no true
duplication either.

>=20
>=20
> See also:
> [PATCH] media: amphion: fix potential NULL deref in vpu_core_parse_dt
> https://lore.kernel.org/all/20250407084829.5755-1-hanchunchao@inspur.com/

I already stated I prefer this version.

Nicolas

