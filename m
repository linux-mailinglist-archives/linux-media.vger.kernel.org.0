Return-Path: <linux-media+bounces-56503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFTKOMsUvWkR6gIAu9opvQ
	(envelope-from <linux-media+bounces-56503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:35:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE52D81A0
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0907F3040462
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173FD376477;
	Fri, 20 Mar 2026 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="ORzCi+8X"
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF904378818;
	Fri, 20 Mar 2026 09:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773999299; cv=none; b=jGm0ZxjHAJY6egnL3hRDbfPIeQAu3YEGMYvDJCOZm2u89yAh0MD26KnyDEAWiQzyHjLpIH174+ZQTNlUH7dtG7cb0BNlwGqTW3HW9qUhBe3hTTtmEzAtU42Mv/QSpl7ByqqGrIDuWxhc3OzZ0rA1iBLxGp5c8Dx/yfG4LxYhjbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773999299; c=relaxed/simple;
	bh=XMXNhDB97POPdC4yYliA92xzV1XofxOKwo4AHwud5PY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uiuQoe+iuPanbGDnVyyOJV8x04Td22zqkLQAgcKHa8prBLldiMktRyeW+LSZN2A7bQwNSVA5quDvjB3vo8xQIMuNHI4+7VhAegRjICJqeGhcUP5kSP8Q4ErSTS4FD6R4WAQnBiGwQ402zXPFm7tUCFFsh/ZN7ucx3wD4S7xIW5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=ORzCi+8X; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=h3TmgZPZBMll2MmFRnP3PbTND06bgHNncokiFMkLotI=; b=ORzCi+8XEz1RDeJ4Nys/4VNAi1
	uETpdk1qEILw0pXMTY8LwSg6GZoJtdYuQXmQhR9XRYQm12xl1+Zx65z+P9PVTH2cL6atvRBDOU6GJ
	+l9ulov9Ppm0kV3SqrP8Y243gQLyJUFk5S/SH16WhWJlDjc8GjlaZau6tRFuzlGtcbec=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w3WFp-005YuA-0m;
	Fri, 20 Mar 2026 10:34:53 +0100
Date: Fri, 20 Mar 2026 10:34:53 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Cc: hao.yao@intel.com, hdegoede@redhat.com, sakari.ailus@linux.intel.com,
	andy@kernel.org
Subject: [PATCH] platform/x86: int3472: Add GPIO type 0x02 (strobe) mapping
Message-ID: <ab0UvRdDpvZBiNsC@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TbSK3d7oWrLiek8F"
Content-Disposition: inline
X-Spamd-Result: default: False [-2.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_DKIM_REJECT(1.00)[kcore.it:s=spark];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56503-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kcore.it:-];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[kcore.it];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.501];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kcore.it:email,launchpad.net:url,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8FAE52D81A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--TbSK3d7oWrLiek8F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Some ACPI tables on Intel Meteor Lake and Arrow Lake platforms define
GPIO resources with type 0x02 for INT3472 camera sensor power control.
This type is not currently handled, causing a "GPIO type 0x02 unknown;
the sensor may not work" warning and preventing proper sensor power
sequencing.

Map GPIO type 0x02 (strobe) to the privacy LED handler, matching the
approach used for similar illumination-related GPIOs. This is consistent
with the original proposal by Hao Yao [1].

Tested on a Dell Pro Max 16 Premium (Arrow Lake-H) with OmniVision
OV08F4 sensor connected via Intel IPU6 and Synaptics SVP7500 USBIO
bridge. With this patch applied, the int3472-discrete driver no longer
warns about unknown GPIO type 0x02, and the sensor probes successfully.

[1] https://lore.kernel.org/all/20231007021309.9332-1-hao.yao@intel.com/

Link: https://bugs.debian.org/1130114
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2138991
Cc: Hao Yao <hao.yao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
 drivers/platform/x86/intel/int3472/discrete.c | 3 +++
 include/linux/platform_data/x86/int3472.h     | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platfo=
rm/x86/intel/int3472/discrete.c
index 1505fc3..39ca60b 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -211,6 +211,7 @@ static void int3472_get_con_id_and_polarity(struct int3=
472_discrete_device *int3
 		*con_id =3D "clk-enable";
 		*gpio_flags =3D GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 		*con_id =3D "privacy-led";
 		*gpio_flags =3D GPIO_ACTIVE_HIGH;
@@ -330,6 +331,7 @@ static int skl_int3472_handle_gpio_resources(struct acp=
i_resource *ares,
=20
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
+	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
@@ -347,6 +349,7 @@ static int skl_int3472_handle_gpio_resources(struct acp=
i_resource *ares,
 				err_msg =3D "Failed to register clock\n";
=20
 			break;
+		case INT3472_GPIO_TYPE_STROBE:
 		case INT3472_GPIO_TYPE_PRIVACY_LED:
 			ret =3D skl_int3472_register_pled(int3472, gpio);
 			if (ret)
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/plat=
form_data/x86/int3472.h
index b1b8375..85adeb0 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -23,6 +23,7 @@
 /* PMIC GPIO Types */
 #define INT3472_GPIO_TYPE_RESET					0x00
 #define INT3472_GPIO_TYPE_POWERDOWN				0x01
+#define INT3472_GPIO_TYPE_STROBE				0x02
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
--=20
2.47.3


--=20
Marco Nenciarini - mnencia@kcore.it
7C23 B804 3E65 D298 0A21  B6E2 589F 03F0 1BA5 5038

--TbSK3d7oWrLiek8F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEfCO4BD5l0pgKIbbiWJ8D8BulUDgFAmm9FLwACgkQWJ8D8Bul
UDhaGQ//Z8a8steppzqhtmuqKvw2xQdoa5MNI8c/zmDITUjlF5vtfmxZprC7lKVb
I6BJ8f/H/i86rv9nTVF8mmXthT9QP1E2lFmXdAxiKni7bntvqrzpTn1faxWxa2Xj
jX4SQRlXv0i6SQJNjZd6UnAn+Y5TDHSicxYYjscIUMfBlB5rpe4wjEkRAceAN9zZ
dn3e6RGKpShGLoX4QwtOSzNqPvwi4T/tdYJyrroA8S8o04bXeqHChue1EH/vWG9y
dVNYjM28ZkULyA6e9/qxgYfkDlCsEUKAfsF7OkV0xpyGMCTGER6VbglNgw1d2eJJ
r17B4QeuSWCeeiZQsmAoIj+bUipYXsMaRA5kcQkURE/dDXzKjWb4KiGarcq1r8UQ
1v8cycoOSIOMHdOqWI+3o1OOoJqcN3x/PTC8PD8g06skTl6khF9yLWK7PWn/CuKy
lU476c+3LRDgLfira8DBUU0RqP/omYrPXL29IIn/LLJaz7dvtGd20RO+ct7bIMru
7PhBAGzfXExHaUYE05II+ajgF1hdWvRIVReZljwWCuO5wc9BGYPxXlpJbNPbZrC7
7MfsgyloU6d9oDy8IT/8uIzWxtxkgGY6S6rkYDuc/ONOeVUoj+hHNU9cwA/v3lt7
4hEzk9e7MWrjElwEnyS82kVR2gV60whpHPfD30Gvmp8qzmaeZRw=
=Vysj
-----END PGP SIGNATURE-----

--TbSK3d7oWrLiek8F--

