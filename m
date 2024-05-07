Return-Path: <linux-media+bounces-10948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD18E8BD899
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B2B51F23A86
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF16FB644;
	Tue,  7 May 2024 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="IxLrg0G/"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A29EA23
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041535; cv=none; b=R8Td7MdigyKA8/XlAHkLkbiEN3LfRpb9yvXrwNg2017PsdJvQ1breiajp0VMlRy/n7gydJDVpP+DANnkSd6ASTgICRd+7qufe4QNOmEDgCfDBV/elScToSGwYutRfHCOouiQlCZ2YcsPUm0KQU6WRDEA3cZo426SRYDc5ruI0Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041535; c=relaxed/simple;
	bh=ceXJ+hHasLwkjwmMQviQbGxn8Y6E93LTfUEGou+Rm7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G1lk1CzQtYJ3NmPp60t8gilGCwcdWLobxMEkSG+h5Matxrcg3gGLBVXYQE3gJT7WadqIJEphX2yJEurUvshYfd7E3TOnVBXjQEzlulpH5zKviNVCemzzhXpnla3URDHk/jIBZ5xpzRFoS/wmMNBg/O+MLSxawfCDyxBHpClsHok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=IxLrg0G/; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041530; x=1715646330; i=herdler@nurfuerspam.de;
	bh=UrD7/HzS21qEJde6ivImb9os6Ry5t2qmBcUKm4FOVEA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IxLrg0G/jQLHLWv8xzRndO506xZi5lbWnunSrYAzv2jbmD1no/15T1fvz4Fbola1
	 3AzCMvj9MtrM1LVPfIesJS6dC0dw+bpVMLUEhNDC/Qw7YXjPnWeRLWuVScMhlzcC1
	 Axe+dziN0IfPIeXd37mvlgNA5MBEkNuyyu02Qstgar6RF6D8SrLamtha7UDq2iTuy
	 YABWTF3Uv/XxLmv0isjqA0JjUTDNaJrgjWotBxp0lqjUVwzzSqrX5/kf1reoxZu4A
	 nYBMo6PKv9t+rM+u+VUa5/bI4mljS8gdaGRj5dPXPjwjGNVFQkzP5/1i7GoU+WTdR
	 yqD4UYN1Px1HWh5KcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3il-1sAvBK3vVT-00TXsC; Tue, 07
 May 2024 02:25:30 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 19/21] media: av7110: coding style fixes: deep_indentation
Date: Tue,  7 May 2024 02:24:58 +0200
Message-Id: <20240507002500.81867-20-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240507002500.81867-1-herdler@nurfuerspam.de>
References: <20240507002500.81867-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xLq78zlf2k6yk6NKlG0VMjM0XVQ9QoCD6p3W2YCHlZ8oZqp5EUl
 sziavTBSTwfixjRvpzMg14lHYaIuK6TNw8tRA9OoTVURj6IluhRtXV//nK8/Ar8BefHTNHK
 f5Bc0yAhDgap6HKFqFYh4F39Tw/kqBAac+Qv4WjtqFCtLObjw6kRhP0oj7L0O4gCNF2wa3J
 0KqDPQpCrM7uEDrM10J2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:V3x/cXGdtMw=;ZLckh4G28OkdmNT0xNzWD1Ne5M6
 CAf8t7DisEsNFvyD9T94N3DmYEgox5e9+AgPUp5WSqDpvFCVzzuzgKMkXuIQHYojTbX3Ikvi0
 aH8T36Jz/6641yoi1uqFeZuoNSemhLGyX2SNtK9zVA8JEzzgC9q6w1WciYDe1Ymu2xA4dMGAF
 frqXiQGxZl4jZSA7yl0Qi9NYWN6ijZGOp8+ugRAN+HTJM2XzMO6TkqxxFFryqkn49zuy5xEWB
 PPqqmncHH+HDanrcFmQqqBYulHoilS96AZLk3W2Lm30pMRM3XvqkRgJxdvprWdN1PML+bpamp
 akYX4EKuHKqHkuh7ngL+p1GQ6By6bbpY086c1tv9wK9MB93umEOhoNhxM96Sim+frcPEkhf72
 bmGA12OrMy0S1bsZbUhP95dQRgrh36KI66IhVVhYRd1xZNZ2IXaYNEaIDx21I2zbKRUu9b13H
 FmsyBKC2EJ0ZwlQrTJXo704AJocUpijvgq9w6Z4elLBqRXWtKmKf5RJ09t7EuKzd2PDDUBc94
 6854aRcLMwgOmHdPub3aW3OS+Zy/R0t1Hadlb1Vfd5u8Z+YcHVR1XOxKUA0OIAa+5Tw5DkooO
 sQyzNBEH52sq6PaIFrCxuWwqCcwKbM9/1vRDaJxWk+c80FyHimERJscsmTQaf64scs6cIg4AB
 LUreNy+9uDKFAhRUtMDxl7LK20mnGU2UJIKp18hN+OL4OFsx3jl/IQPtFAnLD9l/4RQvVYk9o
 qm9aB+d7cbT4/oudOdJPKXuz6s7pSRziS7NePFrSHQyTNM950uQwUXrf+xtp8cB5lsKoXi67Z
 MqxtuJOVCkbNQx4lRPUkgXTwVQM2Wc6ZgAm2mnK6Ch1rs=

This patch fixes most the following checkpatch warnings:

WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactorin=
g

Invert "if" statement to reduce indention level by 1.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

The patch is surprisingly confusing, compared to the little changes.

"git diff -b HEAD~2 HEAD~3" shows the 3 really modifies lines.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

 drivers/staging/media/av7110/av7110_ipack.c | 234 ++++++++++----------
 1 file changed, 117 insertions(+), 117 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging=
/media/av7110/av7110_ipack.c
index 9631aae71..4be6e225f 100644
=2D-- a/drivers/staging/media/av7110/av7110_ipack.c
+++ b/drivers/staging/media/av7110/av7110_ipack.c
@@ -249,146 +249,146 @@ int av7110_ipack_instant_repack(const u8 *buf, int=
 count, struct ipack *p)
 	if (!p->plength)
 		p->plength =3D MMAX_PLENGTH - 6;

-	if (p->done || ((p->mpeg =3D=3D 2 && p->found >=3D 9) ||
-			(p->mpeg =3D=3D 1 && p->found >=3D 7))) {
-		switch (p->cid) {
-		case AUDIO_STREAM_S ... AUDIO_STREAM_E:
-		case VIDEO_STREAM_S ... VIDEO_STREAM_E:
-		case PRIVATE_STREAM1:
-			if (p->mpeg =3D=3D 2 && p->found =3D=3D 9) {
-				write_ipack(p, &p->flag1, 1);
-				write_ipack(p, &p->flag2, 1);
-				write_ipack(p, &p->hlength, 1);
+	if (!(p->done || ((p->mpeg =3D=3D 2 && p->found >=3D 9) ||
+			  (p->mpeg =3D=3D 1 && p->found >=3D 7))))
+		return count;
+
+	switch (p->cid) {
+	case AUDIO_STREAM_S ... AUDIO_STREAM_E:
+	case VIDEO_STREAM_S ... VIDEO_STREAM_E:
+	case PRIVATE_STREAM1:
+		if (p->mpeg =3D=3D 2 && p->found =3D=3D 9) {
+			write_ipack(p, &p->flag1, 1);
+			write_ipack(p, &p->flag2, 1);
+			write_ipack(p, &p->hlength, 1);
+		}
+
+		if (p->mpeg =3D=3D 1 && p->found =3D=3D 7)
+			write_ipack(p, &p->flag1, 1);
+
+		if (p->mpeg =3D=3D 2 && (p->flag2 & PTS_ONLY) && p->found < 14) {
+			while (c < count && p->found < 14) {
+				p->pts[p->found - 9] =3D buf[c];
+				write_ipack(p, buf + c, 1);
+				c++;
+				p->found++;
 			}
+			if (c =3D=3D count)
+				return count;
+		}

-			if (p->mpeg =3D=3D 1 && p->found =3D=3D 7)
-				write_ipack(p, &p->flag1, 1);
+		if (p->mpeg =3D=3D 1 && p->which < 2000) {
+			if (p->found =3D=3D 7) {
+				p->check =3D p->flag1;
+				p->hlength =3D 1;
+			}

-			if (p->mpeg =3D=3D 2 && (p->flag2 & PTS_ONLY) &&
-			    p->found < 14) {
-				while (c < count && p->found < 14) {
-					p->pts[p->found - 9] =3D buf[c];
-					write_ipack(p, buf + c, 1);
-					c++;
-					p->found++;
-				}
-				if (c =3D=3D count)
-					return count;
+			while (!p->which && c < count && p->check =3D=3D 0xff) {
+				p->check =3D buf[c];
+				write_ipack(p, buf + c, 1);
+				c++;
+				p->found++;
+				p->hlength++;
 			}

-			if (p->mpeg =3D=3D 1 && p->which < 2000) {
-				if (p->found =3D=3D 7) {
-					p->check =3D p->flag1;
-					p->hlength =3D 1;
-				}
+			if (c =3D=3D count)
+				return count;

-				while (!p->which && c < count &&
-				       p->check =3D=3D 0xff){
-					p->check =3D buf[c];
-					write_ipack(p, buf + c, 1);
-					c++;
-					p->found++;
-					p->hlength++;
-				}
+			if ((p->check & 0xc0) =3D=3D 0x40 && !p->which) {
+				p->check =3D buf[c];
+				write_ipack(p, buf + c, 1);
+				c++;
+				p->found++;
+				p->hlength++;

+				p->which =3D 1;
+				if (c =3D=3D count)
+					return count;
+				p->check =3D buf[c];
+				write_ipack(p, buf + c, 1);
+				c++;
+				p->found++;
+				p->hlength++;
+				p->which =3D 2;
 				if (c =3D=3D count)
 					return count;
+			}

-				if ((p->check & 0xc0) =3D=3D 0x40 && !p->which) {
-					p->check =3D buf[c];
-					write_ipack(p, buf + c, 1);
-					c++;
-					p->found++;
-					p->hlength++;
+			if (p->which =3D=3D 1) {
+				p->check =3D buf[c];
+				write_ipack(p, buf + c, 1);
+				c++;
+				p->found++;
+				p->hlength++;
+				p->which =3D 2;
+				if (c =3D=3D count)
+					return count;
+			}

-					p->which =3D 1;
-					if (c =3D=3D count)
-						return count;
-					p->check =3D buf[c];
-					write_ipack(p, buf + c, 1);
-					c++;
-					p->found++;
-					p->hlength++;
-					p->which =3D 2;
-					if (c =3D=3D count)
-						return count;
-				}
+			if ((p->check & 0x30) && p->check !=3D 0xff) {
+				p->flag2 =3D (p->check & 0xf0) << 2;
+				p->pts[0] =3D p->check;
+				p->which =3D 3;
+			}

-				if (p->which =3D=3D 1) {
-					p->check =3D buf[c];
-					write_ipack(p, buf + c, 1);
-					c++;
-					p->found++;
-					p->hlength++;
-					p->which =3D 2;
+			if (c =3D=3D count)
+				return count;
+			if (p->which > 2) {
+				if ((p->flag2 & PTS_DTS_FLAGS) =3D=3D PTS_ONLY) {
+					while (c < count && p->which < 7) {
+						p->pts[p->which - 2] =3D buf[c];
+						write_ipack(p, buf + c, 1);
+						c++;
+						p->found++;
+						p->which++;
+						p->hlength++;
+					}
 					if (c =3D=3D count)
 						return count;
-				}
-
-				if ((p->check & 0x30) && p->check !=3D 0xff) {
-					p->flag2 =3D (p->check & 0xf0) << 2;
-					p->pts[0] =3D p->check;
-					p->which =3D 3;
-				}
-
-				if (c =3D=3D count)
-					return count;
-				if (p->which > 2) {
-					if ((p->flag2 & PTS_DTS_FLAGS) =3D=3D PTS_ONLY) {
-						while (c < count && p->which < 7) {
+				} else if ((p->flag2 & PTS_DTS_FLAGS) =3D=3D PTS_DTS) {
+					while (c < count && p->which < 12) {
+						if (p->which < 7)
 							p->pts[p->which - 2] =3D buf[c];
-							write_ipack(p, buf + c, 1);
-							c++;
-							p->found++;
-							p->which++;
-							p->hlength++;
-						}
-						if (c =3D=3D count)
-							return count;
-					} else if ((p->flag2 & PTS_DTS_FLAGS) =3D=3D PTS_DTS) {
-						while (c < count && p->which < 12) {
-							if (p->which < 7)
-								p->pts[p->which - 2] =3D buf[c];
-							write_ipack(p, buf + c, 1);
-							c++;
-							p->found++;
-							p->which++;
-							p->hlength++;
-						}
-						if (c =3D=3D count)
-							return count;
+						write_ipack(p, buf + c, 1);
+						c++;
+						p->found++;
+						p->which++;
+						p->hlength++;
 					}
-					p->which =3D 2000;
+					if (c =3D=3D count)
+						return count;
 				}
+				p->which =3D 2000;
 			}
-
-			while (c < count && p->found < p->plength + 6) {
-				l =3D count - c;
-				if (l + p->found > p->plength + 6)
-					l =3D p->plength + 6 - p->found;
-				write_ipack(p, buf + c, l);
-				p->found +=3D l;
-				c +=3D l;
-			}
-			break;
 		}

-		if (p->done) {
-			if (p->found + count - c < p->plength + 6) {
-				p->found +=3D count - c;
-				c =3D count;
-			} else {
-				c +=3D p->plength + 6 - p->found;
-				p->found =3D p->plength + 6;
-			}
+		while (c < count && p->found < p->plength + 6) {
+			l =3D count - c;
+			if (l + p->found > p->plength + 6)
+				l =3D p->plength + 6 - p->found;
+			write_ipack(p, buf + c, l);
+			p->found +=3D l;
+			c +=3D l;
 		}
+		break;
+	}

-		if (p->plength && p->found =3D=3D p->plength + 6) {
-			send_ipack(p);
-			av7110_ipack_reset(p);
-			if (c < count)
-				av7110_ipack_instant_repack(buf + c, count - c, p);
+	if (p->done) {
+		if (p->found + count - c < p->plength + 6) {
+			p->found +=3D count - c;
+			c =3D count;
+		} else {
+			c +=3D p->plength + 6 - p->found;
+			p->found =3D p->plength + 6;
 		}
 	}
+
+	if (p->plength && p->found =3D=3D p->plength + 6) {
+		send_ipack(p);
+		av7110_ipack_reset(p);
+		if (c < count)
+			av7110_ipack_instant_repack(buf + c, count - c, p);
+	}
+
 	return count;
 }
=2D-
2.34.0


