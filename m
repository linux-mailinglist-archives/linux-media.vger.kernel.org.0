Return-Path: <linux-media+bounces-26968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAA0A4463C
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 17:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A7B19C25C0
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 16:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EB6195980;
	Tue, 25 Feb 2025 16:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="VTBQD9jC"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC97194C9E;
	Tue, 25 Feb 2025 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501278; cv=none; b=HlRG4oug/nRVahRSVnbq/F8ftE7JK0OQISxEyEIax+O3ZXMyVB4+Tldf7dFf0W/+6b5xkps37r4RWIkk/+PfBZhU+B5MZ3VJ4LDQoo4J+ci940/hauXCel21njFmXVilLUxgX+VWv5SX2VfUZrIc0WoXndjRRfmS2TDsSnVkjZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501278; c=relaxed/simple;
	bh=1I0X4ltiGArS/4LY4t83f7eFtoxhqR2YlpZHJjc4/AA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=CkHgNSjXcL7ty/SxmSwlygmRddiDX7xtmtX0w0Hz/iU5YjtCNXaaMjQGLx230FYyjnLFGvc6Vta+c42Bg0R8LumqxmRwoOvpJNnYOLg7VHvtwLvyTX8TSwoOZCa8Y+Vbr/3lcQa1KMtEpBkk47GEnBM6B+vxRRRpbfE3p2C2d8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VTBQD9jC; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740501264; x=1741106064; i=markus.elfring@web.de;
	bh=6F/+BR3fuIk7qDEk7fWKObdKldJLm53E0U6iRmv2vRI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VTBQD9jCL5+Hw0tIVKpDJ4zCNLPJK5jZuNPO7qlfkuDBYSPblsvCwUlOreIxJzoY
	 pYO3vhNCLa7hm63831Y9MhlteK7yaNIaqAMz+8OHeyBCK48IpW1HuHKT+qTYOUs71
	 QslMPUNoZsoetXnbdSfkh+N6GC04G2iETihgPs1zlYWT1ak8FAJV8X7rxGUx24OXK
	 csrSpQGQNO+LuYllz2TsYZS2Jy4lNo2KE417lR/4J9GROG2gU2w6bnl6qMK99IGta
	 UIZCVtMvBR/G0VUh9qYBpcVvit49JZkskE4v+kESYgM4htTWi9HZWQEC7e/zvDhU4
	 6waCt2OHxtDG5ElhRA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.36]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYcpt-1trWLb13IJ-00WyfW; Tue, 25
 Feb 2025 17:34:24 +0100
Message-ID: <ef3f1c7e-30d8-4cdd-b07a-41162adf245d@web.de>
Date: Tue, 25 Feb 2025 17:34:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-media@vger.kernel.org,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250225125937.20413-1-qasdev00@gmail.com>
Subject: Re: [PATCH] media: i2c: Replace nested min() with single min3()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250225125937.20413-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6cbFpp+AElXxu39FIClzrBRRibUKYCpleTgIyuXapN1joZl+EIF
 KoRVw57cgxpftKMKGIJtZWtpAJP8MGgvdrvZ6zYjsw6yjplZvYcwTsIQ4niFAWpkIyWMyM8
 EhqtzdlDkq27jBWf1sAicj2fZrxo3tHwpnnTbxEPOzpwXO12Ava+Rjr4l3P5BR8n8vlhjeN
 2nsVGUdhfH36BW8XWLfig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jzFCJJcFtLk=;zgyC5g0HxtMAAXOWKvLbawFbXfO
 gKmfENYpqUE1FPA/5bzDdimFWYfgZW7HWlDymGu8kCFQOONzk7YVzU1C0B08yLh6YDbB0K3iE
 W1mXeSp8R8yw5MmZs8ieWm0/vYEgugMPFgF58yHqdwb/aHl/IJBpETTDhVewL1UNV5E6hzHWp
 69Z2Xa2bVC9moSwK1jTXg8H42/5aJmkPDo5Rt1zt5+Cc9yPIVilrWdDW0eOjEmerBkQbJISFd
 J6gKK2FEEK/0R9Jev1rAj0w+DRhjwCWIIejTnKAyWdhrfv8UCFC1tibqJAPWBmInWSI3CsiD2
 bePREbrumrKEYlvV0pt9ovdb4Blpe82dvTCgoFFpZFeYVIDGZ7phOOGgg4R2emiX/qwSwbn0s
 ANiWcF0wM7uO032YNQYD24QHgzz+VsI1MZPm6+b91PdEEIa2IxFmyRQF7An9NaHZJWhiQVyii
 3PTyEWHOD/wbUgLW0UvJCjFNnE7KR3Z5ouwdU9g3Nk1v+jGu0qvhucZxEAfOe+yibfcOZYoj+
 4tqbXv6AW1dDdAjXUqAU1pMN9JC0aHvhfVCq0rzIaeIqN63Xb+TB7tE7r9YkTHaQ6Vqrk9ZI+
 dXBuclRNzKLI2rST8vmLJOssu+FNOSawHoKDNd+Ff/heJssCv6tfq4IOXzmX3gsxdr9IgnPJa
 +maLHkUuTGeQA86/4XcMy/o4YcXhn6jSVDJMewbaE42d9f6bfFRaHiChWCKrNHbvYSEV75E/P
 e6l9mtuJcnnbZQbHVjZcFnanXEyW0bfJI43oZyz11VAgjMukLxAfr1vbijkrPkN8ngHOu81Yd
 VpgQb33ptIvmbyfqRJe+yVhNTG9RWqiFtjUhqrXyLx+vEF649ywEZsniXst1IVZZ3hgjhwym+
 WYP8ASIG1+tCSYliMe8Yw3aBUqUx+M/4AgRnyhrZRcdiP1+9hE4eFZat8Ii8sDS2VDmaba6xU
 NPgV4rX+kLsut/h2tpkgi+jNOAbU6+1k67Vncpge0o977rfWzA6aJiEMdFvWS7yjU47v7PkiQ
 u7thVjt4U80CZ5+VGfCaOW5ft6NlRqVm/Xtt9prDrMz9+fj/6lG97LmA8YL7acjBC+yuKm29G
 BQkN+kgnp9X+yvLVARvt9WV9obdKVAt3wYVXLolY49yrb8VJleJRKxYtY7kDRSImpV6wi9dOc
 HdAO5glsAFdZ/fSnKhgscb2NyE3tlR/s3l99MyNEwEBc8AnHcegDblGYdub3b21Cpb21Qq8Uv
 MAI7Bazk3sN5NO8XrfjkxLIraoOk/Z1LX2IIH9dV00Zj3rMJVSuXU+i2HQ8LQIBh5/p6nf1p1
 LhF/9fPUTOSfW49ogiNpfYEq7yGCKZNWN5qy75XN9wQmCs5mrzA69bGdYohlSA6fTlCe1LisL
 UnLy6J5SvxsVtXNLXiVg6Codwzt1n0VhuJu6vBSTg/3eYd27H2q6fY2r4WeUpNQ7zna4W6E7A
 N31j3KA==

=E2=80=A6
> +++ b/drivers/media/i2c/vgxy61.c
> @@ -892,8 +892,8 @@ static u32 vgxy61_get_expo_long_max(struct vgxy61_de=
v *sensor,
>  	third_rot_max_expo =3D (sensor->frame_length / 71) * short_expo_ratio;
>
>  	/* Take the minimum from all rules */
> -	return min(min(first_rot_max_expo, second_rot_max_expo),
> -		   third_rot_max_expo);
> +	return min3(first_rot_max_expo, second_rot_max_expo,
> +		    third_rot_max_expo);
=E2=80=A6

Can the following source code variant be applied?

+	return min3(first_rot_max_expo, second_rot_max_expo, third_rot_max_expo)=
;


Regards,
Markus

