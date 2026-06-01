Return-Path: <linux-media+bounces-63302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMCQDCSsHWoLdAkAu9opvQ
	(envelope-from <linux-media+bounces-63302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:58:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C381062229A
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0EF13018881
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99653DBD7A;
	Mon,  1 Jun 2026 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="H41/ouOP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9503DB627;
	Mon,  1 Jun 2026 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329488; cv=none; b=qXd3Ueogp6qMuuhUDz2zc6QJB37IbqmJdgs8fh3TMtvmHml582PpSLrOVBQebNhP6ruOo/q3l8B197THvXUDIJUPfxCzwXNVs7cig4kztyKMR9Uv7YfzJaPkOkQF3g8IgR5RUJgwcTrFxwAhvJa/7AkWAVtgMK54+OjXiGUMCwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329488; c=relaxed/simple;
	bh=dU4T3mZ6PmW6TXBZjcY3Rv7X6u6bZ5TcDvtHFT8Z/fI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odUkIcgy0QYgfY75SlUp3GUQdaO92Yjjb9jRju0otssxlvB1RsNUB31dpzRQAIkz3TOt9HpK7yBZF1od9Jro5FBRlezKt94WSF0oDPOIAj/I/l1wh77gBYlR//eLqxjaH1ehkOQrhAXY6aAvvlfzWw+vEEZ51HIOF7t+78cZd3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=H41/ouOP; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1780329476; x=1780588676;
	bh=NY87X2lFoFobOh27lPTDtROXYG5P4N0cXKP8ir/JG3s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H41/ouOPmPFCiZw/lNByHA+Z+TaS3mqWmj9p3a2ia5nh3bNsIW2QEpTC9ULmdbcl3
	 5oTpP/uYZkVbTW4OZvvptJWYIuHP++KOPqIinDYnw7jm/hROX0tB3Ni9dqoK7I9WUa
	 vx9NqRjWybIJy4DM5kCZAOsK/nh3e6GupWnAzYNrTolrarTofcUZHLK02+uIIlJNvg
	 HKETGkyRt215WfUYJENu3GQiY8WPmMDIFSYUFmFR9XbIYf6qKK+6pcBG8roRPBDsb0
	 5aEf9C79Q02OeQ+yoErUJCf8X6iWEe+UEX7LR2CPKOk4NhI+Yi9eynSrUyMjOsblQy
	 5iO59fQK45uAA==
Date: Mon, 01 Jun 2026 15:57:50 +0000
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH WIP v5 1/9] media: qcom: camss: csiphy: Introduce PHY configuration
Message-ID: <d32ad64c-132e-4ba9-9745-39254a479785@nxsw.ie>
In-Reply-To: <20260531-qcom-cphy-v5-1-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz> <20260531-qcom-cphy-v5-1-6be0f62b4d65@ixit.cz>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: b5dc7ce8f6a2f6de754d5fa2bd7b102372e6c996
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxsw.ie,quarantine];
	R_DKIM_ALLOW(-0.20)[nxsw.ie:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63302-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod.linux@nxsw.ie,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxsw.ie:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ixit.cz:email,nxsw.ie:mid,nxsw.ie:dkim]
X-Rspamd-Queue-Id: C381062229A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/05/2026 14:08, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>=20
> Read PHY configuration from the device-tree bus-type and save it into
> the csiphy structure for later use.
>=20
> For C-PHY, skip clock line configuration, as there is none.
>=20
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
>   drivers/media/platform/qcom/camss/camss.c        | 8 ++++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.h
> index 9d9657b82f748..2ebb307be18ba 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -25,21 +25,23 @@
>=20
>   struct csiphy_lane {
>   =09u8 pos;
>   =09u8 pol;
>   };
>=20
>   /**
>    * struct csiphy_lanes_cfg - CSIPHY lanes configuration
> + * @phy_cfg:  interface selection (C-PHY or D-PHY)
>    * @num_data: number of data lanes
>    * @data:     data lanes configuration
>    * @clk:      clock lane configuration (only for D-PHY)
>    */
>   struct csiphy_lanes_cfg {
> +=09enum v4l2_mbus_type phy_cfg;
>   =09int num_data;
>   =09struct csiphy_lane *data;
>   =09struct csiphy_lane clk;
>   };
>=20
>   struct csiphy_csi2_cfg {
>   =09struct csiphy_lanes_cfg lane_cfg;
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..072c428e25166 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4761,19 +4761,23 @@ static int camss_parse_endpoint_node(struct devic=
e *dev,
>   =09if (vep.bus_type !=3D V4L2_MBUS_CSI2_DPHY) {
>   =09=09dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
>   =09=09return -EINVAL;
>   =09}
>=20
>   =09csd->interface.csiphy_id =3D vep.base.port;
>=20
>   =09mipi_csi2 =3D &vep.bus.mipi_csi2;
> -=09lncfg->clk.pos =3D mipi_csi2->clock_lane;
> -=09lncfg->clk.pol =3D mipi_csi2->lane_polarities[0];
>   =09lncfg->num_data =3D mipi_csi2->num_data_lanes;
> +=09lncfg->phy_cfg =3D vep.bus_type;
> +
> +=09if (lncfg->phy_cfg !=3D V4L2_MBUS_CSI2_CPHY) {
> +=09=09lncfg->clk.pos =3D mipi_csi2->clock_lane;
> +=09=09lncfg->clk.pol =3D mipi_csi2->lane_polarities[0];
> +=09}
>=20
>   =09lncfg->data =3D devm_kcalloc(dev,
>   =09=09=09=09   lncfg->num_data, sizeof(*lncfg->data),
>   =09=09=09=09   GFP_KERNEL);
>   =09if (!lncfg->data)
>   =09=09return -ENOMEM;
>=20
>   =09for (i =3D 0; i < lncfg->num_data; i++) {
>=20
> --
> 2.53.0
>=20
>=20
>=20

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod


