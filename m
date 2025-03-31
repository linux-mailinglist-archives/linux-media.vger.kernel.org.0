Return-Path: <linux-media+bounces-29039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ADBA76265
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD79D3A4FC5
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC401E2312;
	Mon, 31 Mar 2025 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDIMiaM8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5550A1DE4E9;
	Mon, 31 Mar 2025 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409926; cv=none; b=OBgtd4yJw98ts8eoP47Pt/km1oDqn+htmAJx9Ws9KjK8sLWJKqPvRsVZSDwF7tM/S8BThq6vnSlPF15+e9MzZCLk3EJd0UCrk5b1FNgz+dNWVaBoC0sZW606LwdP2/Q+oCAcmkiKVFOsIz0J05R/vq8HsBHZQsXWxKMnzukCTWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409926; c=relaxed/simple;
	bh=Ox2GO5lQKYVL4kYsRQotXKfVSyMyuluCQgezA+8ZxZs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qmFXOJNXf8By1FNy8rsRoaPKtltgu0K8RHSKKZWGZ81OtHbhw9RvWZlez8zT3Vp1BmtIogBeqViYb+09sFlKffEydSrgFWOUyHVNYticwUGBCjvZYWn9tbCzxf2wExfqjZMORu0x0sPVmRdPEC8FmDTWq3vWVKay5MrtfznSEVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDIMiaM8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-399749152b4so1622001f8f.3;
        Mon, 31 Mar 2025 01:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743409922; x=1744014722; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+tMNbKgRiLB8lJVsYqkKDo0KO7uHRjBBHK5RlY3Vjg=;
        b=lDIMiaM8K2H2h2L0ki1QBp8vNsXbPN2NjToE+QUFTgCDN41OPJ64AnW+LAyOs+0msD
         VrtuUp6Aq7QyGyAz2DLDZFaj/3malFuKnuCcldXsU0Yez0WH0JnVNsj41LiQayBXKuBN
         vJ7b4Yu/NV6/85UEnLrguFa8aAEgK5XdVkNQg57XkpUQ/gnVbwRYpDYOXw611HCW3HRk
         aTXRQeS5mwEBJJkDeWBDEZ07AaTHjEj2jGkS9JkaVNN7zZeJYHlA/tQ+K790OYt6HCVM
         bzonvlro10zVkgiZrxdE87RQdV8zrxrZT4VbnbEwZGSH/j12JWQ8oEUT6MgqJxBQwdGY
         9YuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409922; x=1744014722;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+tMNbKgRiLB8lJVsYqkKDo0KO7uHRjBBHK5RlY3Vjg=;
        b=O/Zf5wm3JlXQwtooXKF5H5E7MkFf3spjq7AIPdhSqvSmt0oA2DOqUS8OtaJeYBv1Do
         oy89z/mDrJy7R/nLHWSa1bP10lN7SEi1bFFhOrZfJwcsA6PXRMb4KRoxQo7zCn0J+sOY
         1FuZApz+w5CVLizXodfOrEvJCslUe/XtaiBRKBA6f7pfS75mZ9dQxpTUML1dSpvcLAo8
         640zizVU4F8OcNMDki/ZSOB0C5c5MpU1D19jmg4UuQ9ztmKN2QAUTi+k2BQLjIAoT+i2
         Ejx2sn8SlUg4tCdqHfO9aX1B8l6utcUzTZzTcripl7/GazO/hE3Qu8XbN+Tt7BPyofFm
         5BKA==
X-Forwarded-Encrypted: i=1; AJvYcCVMy5rpCD7qZQXT6I7M7VsEjlXVaJbb9xDtB8AQKFszsNBZa2YMIwPr+2+CwcqxBXsu2cpjFU3Q9cMVCqs=@vger.kernel.org, AJvYcCXZm51sFDtmWeaVCV03LfeoSKpX9ssFsn0jLoIEiowj2nAzge1riCXEbynje3aEM0NoTZjmBlZPvQpIJhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPpGmxdNs0LhCtgp4xlgp+oPnluKcIIhc+2k6PlMWtuDGb8Q29
	CKvie7FHQ9YZA4rlN93UFidgpW7+4dXQqCBvRVCfPV87SOBDtHz8Yj0aa9dvwsM=
X-Gm-Gg: ASbGncu1TeHTSePzh6TWNv1+VlsRZFbfPKQS+eO9OGGYyZqOlNb8bV2BsJUhKd6w+12
	7CJ8VA0MR69j9Qp8XYC5W/HPVvsGNz2GdwqipWbB9FU0z8A4mo/bv5khpw0aMM8V0Z4o7+1LGPu
	BMM4SHgvoOo3rLDvmUHlu+Tdp2x8WX0WHQL3LDgl5TeqRFMeGpANLRdswF2rlMoyM6oXepIhbDj
	D/1ka4/sE3uI+tsAICmXzvIST8o25dSB3kt6vUHy1U6sdLMUhmZlqF2LDbWwiL9MNdMu7QXBhCp
	FlGMTH+GNagNXx8Il5IzaHP2PX+6jF6dnLzV6PVizcUxyTEBjZczQlLD7FgWGTwI9xjzzxzIFe2
	OmfRN
X-Google-Smtp-Source: AGHT+IF3IIX8Y8HMwmC2JofIJWbpvEKbvMkmKYJ0OfZmqccgguuLGNeaHlQct7nTtg1tmqoXIiA+NQ==
X-Received: by 2002:a05:6000:1842:b0:397:3900:ef8c with SMTP id ffacd0b85a97d-39c12117d11mr5330258f8f.35.1743409922427;
        Mon, 31 Mar 2025 01:32:02 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e082sm10814632f8f.69.2025.03.31.01.32.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:32:02 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] media: si2168: increase cmd execution timeout value
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <Z-pNBAVhUwrcwDQe@shikoro>
Date: Mon, 31 Mar 2025 12:31:48 +0400
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Peter Rosin <peda@axentia.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0073F061-994E-4DE6-AC0E-E7E03DD30275@gmail.com>
References: <20250331075838.3444332-1-christianshewitt@gmail.com>
 <Z-pNBAVhUwrcwDQe@shikoro>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

> On 31 Mar 2025, at 12:06=E2=80=AFpm, Wolfram Sang =
<wsa+renesas@sang-engineering.com> wrote:
>=20
>=20
>> if (cmd->rlen) {
>> /* wait cmd execution terminate */
>> - #define TIMEOUT 70
>> + #define TIMEOUT 200
>=20
> While we are here, can we rename it to CMD_TIMEOUT and put it next to
> the #includes?

I=E2=80=99m at the novice end of kernel contributors, so like this?

--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -9,6 +9,8 @@
=20
 #include "si2168_priv.h"
=20
+#define CMD_TIMEOUT 200
+
 static const struct dvb_frontend_ops si2168_ops;
=20
 static void cmd_init(struct si2168_cmd *cmd, const u8 *buf, int wlen, =
int rlen)
@@ -40,8 +42,7 @@ static int si2168_cmd_execute(struct i2c_client =
*client, struct si2168_cmd *cmd)
=20
        if (cmd->rlen) {
                /* wait cmd execution terminate */
-               #define TIMEOUT 200
-               timeout =3D jiffies + msecs_to_jiffies(TIMEOUT);
+               timeout =3D jiffies + msecs_to_jiffies(CMD_TIMEOUT);
                while (!time_after(jiffies, timeout)) {
                        ret =3D i2c_master_recv(client, cmd->args, =
cmd->rlen);
                        if (ret < 0) {
@@ -58,7 +59,7 @@ static int si2168_cmd_execute(struct i2c_client =
*client, struct si2168_cmd *cmd)
=20
                dev_dbg(&client->dev, "cmd execution took %d ms\n",
                                jiffies_to_msecs(jiffies) -
-                               (jiffies_to_msecs(timeout) - TIMEOUT));
+                               (jiffies_to_msecs(timeout) - =
CMD_TIMEOUT));
=20
                /* error bit set? */
                if ((cmd->args[0] >> 6) & 0x01) {

Christian=

