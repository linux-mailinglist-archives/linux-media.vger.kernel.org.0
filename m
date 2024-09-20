Return-Path: <linux-media+bounces-18416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0DA97D549
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 14:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEC2F28253F
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 12:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99E114B970;
	Fri, 20 Sep 2024 12:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=avnet.eu header.i=@avnet.eu header.b="JmA4mrTA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpemea03.avnet.com (smtpemea03.avnet.com [193.34.102.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCC313B5B6
	for <linux-media@vger.kernel.org>; Fri, 20 Sep 2024 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=193.34.102.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726834605; cv=fail; b=EbU+DBBdX5O10n2gWH349TuMotSE7HlFkwP6EWdrhcCKTT1bTAzSlhTyBvagBxRpKbmMrS40zCgz2zmw2fDs5qRda3txA3Llx+BRMDqea3T9wcl1KIhuJ6ngVMbQxkdSIkTQyhxphRQCtuFjeFzAUuIBM0KZrYiL2ZsZBKZ84gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726834605; c=relaxed/simple;
	bh=3V38Gpp8VGNHytCILPmdA1vHQXHev1YfvPxLJ/aSrJw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i869RxdFJfA1jHkfjv8gqXxBMfb8JhT/szGdl/VK6peJu5d0Gn2eA6FCM2utW/SSrD/4ur4I4jMprFPWESrxBnpl2gm9nRbmr5tOTGjuHee+IjdNzs/p5X+sTJe84CLpb9s/S8yP51LzwYovq2CmuCXVTS5tsWSGpe1QkKFFet8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avnet.eu; spf=pass smtp.mailfrom=avnet.eu; dkim=pass (2048-bit key) header.d=avnet.eu header.i=@avnet.eu header.b=JmA4mrTA; arc=fail smtp.client-ip=193.34.102.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avnet.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avnet.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=avnet.eu;
	s=20201007; t=1726834592;
	bh=uztfgqpA6xuFgAeXWmSo3kzto8UG3r/huc5FiVIKmIY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=JmA4mrTAnJF/9DiM+WmN/37UOq+j7CU4ndoZi6gTsayZVGMKyommvd0KjV8dYJzUc
	 D5mIvcsYYYHrtXbml/enDycTNEkBCPRDv+UOpcnY3NlsFaazGDzqy7ucPW04iJD1u7
	 3thTDJwxA0ADIop4BE9WEJLAGhaOYHum3A2ycUj4fHT99CGg+qflAaqGXlu6sMwDEy
	 v67Ou28aXe06Ds93M4I/ll7G7zJO5XtHSKO7rwrNwcFcfoXXTzkNYNMIPg0bs3x99K
	 fwLs9ZmOMa0PkaIL5nmRLnCp/iHwnLt6zcMkzs3n868z4BPOIL2TEBaIrvTZlxH1JT
	 t9UXud+YCnVow==
Received: from DEPOIX0MX19EMS1.emea.avnet.com (Not Verified[172.23.112.142]) by smtpemea03.avnet.com with Trustwave MailMarshal (v10,2,0,5718) (using TLS: TLSv1.2, ECDHE-RSA-AES256-GCM-SHA384)
	id <B66ed67a00000>; Fri, 20 Sep 2024 14:16:32 +0200
Received: from DEPOIX0MX19EMP1.EMEA.AVNET.COM (172.23.112.140) by
 DEPOIX0MX19EMS1.emea.avnet.com (172.23.112.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Sep 2024 14:16:31 +0200
Received: from FR6P281CU001.outbound.protection.outlook.com (172.23.112.39) by
 DEPOIX0MX19EMP1.EMEA.AVNET.COM (172.23.112.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11 via Frontend Transport; Fri, 20 Sep 2024 14:16:31 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ja3Y0NWD81L6sIG/jrNdVIrZLdFr0fgwPtvQUbl/oAQnJwdHWJRz8wwPxS40ekMCBKkr6ywjAGisqveZOowEbSXR860tzWh0qD6R2U4gX8+WwBmHqisuuNmIV1/sisl6uRGshh/ZqHGkd8NdTraDoUxpl/Q0479DM2/SyU9QTUOvS+lvGDwDjlQ3yKoUDbenu3MZiH6MaAoj4/mBHQcCFRbv7xnsQGH0JpCRh4FVM1Gqi6lUHNeLWBmhuDk8PgwLa/MPZhXXlnz+7cGbswqCHNIl59QJK/OaKqossZ1jHPoYLFQsNhk1JkySdzp3r4+rouRq8Q3didGqGktY9rohog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQ4tX+AwnHAEziVB/hjULePgwpwJDmmngc9oDSXBlKo=;
 b=se3RB2WUs9dTVzj2FelnjYPlJjgaTxKoyd69Has7LzppIfcJRUavWQTasU9cHpXb2IQ/tQgAtBZrcHIYZt9Fet9CYXfHKRJEl8+oQDIRr3k4ejeNrqYLNZhrFEE/Kxb9h0s37FtIWkyxmlnxB9LGyHRGWRWCrAxalzl9VI6lJczfA/rDFna576vyKLjnpo1UiqZWuWG/5v81djb/QBjqLcDNmiacenmuwDDB3mqd56EaISqqWMH6XI0R6KV5RhElLq9X1nECq1QDaZe/EGfXFiibUCiQiiEygKLcLQM+/u7G1PJUdUSvgQOfMHh4+bWkkpxEP8JrCy+dHUHkyQm2qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=avnet.eu; dmarc=pass action=none header.from=avnet.eu;
 dkim=pass header.d=avnet.eu; arc=none
Received: from FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:d3::6) by
 FR5P281MB3905.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:108::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.22; Fri, 20 Sep 2024 12:16:29 +0000
Received: from FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM
 ([fe80::9d0e:acae:7d6d:f567]) by FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM
 ([fe80::9d0e:acae:7d6d:f567%4]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 12:16:29 +0000
From: "Hecht, Martin (Avnet Silica)" <Martin.Hecht@avnet.eu>
To: Sebastian Fricke <sebastian.fricke@collabora.com>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
	<linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>, Alain Volmat
	<alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho
	<stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Hidenori Kobayashi
	<hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>, "Suresh
 Vankadara" <svankada@qti.qualcomm.com>, Devarsh Thakkar <devarsht@ti.com>,
	"r-donadkar@ti.com" <r-donadkar@ti.com>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Salahaldeen Altous
	<salahaldeen.altous@leica-camera.com>
Subject: AW: Re: [ANN] Media Summit September 16th: Final Agenda
 (v7)
Thread-Topic: [External]Re: [ANN] Media Summit September 16th: Final Agenda
 (v7)
Thread-Index: AQHbCOKWW7qiEqPsmE6vxaR0TgwsJLJb7xeAgAE22gCAACMLAIADUk/i
Date: Fri, 20 Sep 2024 12:16:29 +0000
Message-ID: <FR4P281MB3434AE7AEB218146C9CD062CFD6C2@FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
In-Reply-To: <20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=avnet.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR4P281MB3434:EE_|FR5P281MB3905:EE_
x-ms-office365-filtering-correlation-id: a846c4a5-fefd-40ba-c4c7-08dcd96e0ea6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?3+xyqAPw7y+z3Vrg66EZvV+xW+oFaEYMXhsF+uRbOP8NJHkifGbQ+3O50X?=
 =?iso-8859-1?Q?fFrX3r2Z9ccQSJc0ZruI9PjG4QcTw0PDni9QdZl9FIc6GvioZ9ZrIdz3UJ?=
 =?iso-8859-1?Q?U1vYCVQSyWio9dBVY8UVmtG2q9iE0bQz/yTc2NfFIYvWimCx1rLey1cELZ?=
 =?iso-8859-1?Q?o5gvyEyG3J+cR0n+VVEnrsRwjuXeXqagrb3NS1N1E0qCKxgPbjPH/TaaaS?=
 =?iso-8859-1?Q?LgXCTVGozPCal+bAw1KpLpfJpV8e6wFlNmJF0xsJT5KPVejn2Mw8tLXX6B?=
 =?iso-8859-1?Q?QyRzXBsGBkXF2y8vs7Rdd52tMP1AhjU230MTUKQws5A/upSqgsJ5yH6B6h?=
 =?iso-8859-1?Q?0dSJ/KaJUbWIqR+I7UxX45pJp6LWTrG6yyG3Ok9zWv/AdYHSGIXwk1v0MY?=
 =?iso-8859-1?Q?wOOmGi+9XcpopS/kjDI4nESeL2x8mdUa4QmrrMc3g4o9BcI9uTb2bCzK7f?=
 =?iso-8859-1?Q?GJ4K8OC3JQ7Pjrj+7DhF8Nxj1ZRsmbHI6Jjg+6hnQ0aQiD0fkJK6zC3Pm+?=
 =?iso-8859-1?Q?yOOImNhgeBaHYXiNKYAiwg3QP//72bpYCZKuQ8mlZLuXpiUdGwG/Uwj9cC?=
 =?iso-8859-1?Q?sJSfwW2KpHxmZyB4CB3Vecno/KPDOgfkotJSeqsuHjobf/J3ayfvEi5Hq4?=
 =?iso-8859-1?Q?FQAQhlnUt/A6XWejS3fCitnUaBP+pCj4p5z0GBJyzJJSskUpKrTr56G6CD?=
 =?iso-8859-1?Q?Jj6scHjahiTtLeh4062nGkRpKQxIeE4c299qKQIwTFEd/0gOyN/rbx16Hq?=
 =?iso-8859-1?Q?8HnAHLIvxZU82CbTU2W1v+ozKXiRxlstBouAHqT6c5stTKN7PXgEXOBrls?=
 =?iso-8859-1?Q?lXmkrxYHCWKR+G1Mx7k3tGWs+/LYU92nEoZwdmFNp/toTR5ljLUrTwj/1y?=
 =?iso-8859-1?Q?j89zDKRI+PAWUVaubU56/iSCLFEJKyf9t+pMIedC9D5ugWPJGMvNw3A38X?=
 =?iso-8859-1?Q?97Nve+v7nHZCunZforN3kDCR1+QGXd/G3tUTaBVcMyVn6jlDresMYhEQ0P?=
 =?iso-8859-1?Q?nnzEgRfCctWn+lTFlgoceb9PsMi2L00EToZdLzz6TfjvfBgJOODFI+Dmo/?=
 =?iso-8859-1?Q?cPHsOGVcIplwIUIYy8qnZ21MBXPLT9dC9zGqjYPOTvcKWRJ2JCC/YY/LLh?=
 =?iso-8859-1?Q?6ntkTGiUIMT1MS9hZBCmHdxg2f9oYofSuDbcmezQSzfPzjLiTlUkBc+lbW?=
 =?iso-8859-1?Q?ycagJzNozrBnRUKcxeBJIFyyC/bR5Jf2XENaxJeSe2Y+tGikl81HFcRrCd?=
 =?iso-8859-1?Q?aa2Tqe2MHQ3Lm7M1yCDvHSs1XJkxPXzba5khvntgfF/IhKGdcUdifeb5dd?=
 =?iso-8859-1?Q?5CS2US6CpIay9VMys3ogTqVsWA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?er+bD1Bprd8jtTBeRen6GHcg4bAC5r+dP1hs3Lu8TU3sv8YcL2YIoMeg1O?=
 =?iso-8859-1?Q?WhxvXJNGi+L7dU8Wq4L5bWWoihjy4gSYXjF0hBYo5Mr+RcoY+SOn1cqquI?=
 =?iso-8859-1?Q?y3LYyIPlEX+3FR7xCasdOnn8V2zo0yv9mjDUbX7r369gcnR0axVIUDK5cj?=
 =?iso-8859-1?Q?bEqC5LWa73TlWGXnykxJpEFc+lLTYrmn04IJwM2Yi2Tf8XCiacNf8pDE7o?=
 =?iso-8859-1?Q?AQc7wRXg/zriUHU7rQzaeqfPGj64c86KADpiJ8bxK+UFBPkmlOmDNCl9f8?=
 =?iso-8859-1?Q?rhfERzUrINvlDFMGGMVdOe6oM8AL8zffLzZD/yMAPmwKKZOoolw58CxepY?=
 =?iso-8859-1?Q?+DzdzMr21gPzvUNATrwOAuIimPI+V+QY9lGxBTGa28O+qn9gFfpsBlxq9u?=
 =?iso-8859-1?Q?0m2W0Yt7mo8x9VmjjlKfk/1mVVJijxOa4ZjYs+2EtzoY9XK+zVSkZWb2vq?=
 =?iso-8859-1?Q?l1nbxsS/iR4HnkQyz7Pxrm222ncoxXUNrix+/BFedRFRGWhX9FBpjKcoNq?=
 =?iso-8859-1?Q?Z6zgPkr+G0P1hE8yMtV/QMYv6Q28IZP6qwaRMqvmAmrRN8LS3jIuKQUjxb?=
 =?iso-8859-1?Q?PmK63dRlcksJ45UPBzCI/xjFrdKDQIL5wXJAdq6hlO+hwMwfqZUnbxzwW5?=
 =?iso-8859-1?Q?vfqDl3Jn72G5Ow4St1+UDsg97rzZZi19k6oYEjrzEmghCxke0nRTtCypMT?=
 =?iso-8859-1?Q?yCaNVz5tPdiMemKvJcvODVEs49LXFGB+PtD0QTuR9aKd/WWF+6dViBbaYm?=
 =?iso-8859-1?Q?sMP8GR15uWwg1Tb+EdJyWcb8L/RGwh+3Mosi49+Sf++mmZ8JaqfaIeM6HG?=
 =?iso-8859-1?Q?YI5SalZwjPSMLxgdeMIbmSUGiKwWJt5ka4bryegvu2OVCADU5brvAxKvJS?=
 =?iso-8859-1?Q?schJb/ZmhPoxjzvZ5RzqTEVCjBpAydv8Q/HwVSF8Xwe+7LycTRn0Vlbivd?=
 =?iso-8859-1?Q?7l7SMhGryTz45Hkc5zghSmXYIp8pY69xI5YyS5gWtX2c1rOy1PBm+Fv3X0?=
 =?iso-8859-1?Q?9FT5wjqKPL7hYQkUq12sNsrKtwYRcy1kA5FRmSZA+hA85x2EiMD+thawGI?=
 =?iso-8859-1?Q?ppLUwsouG5NnGNZt3Z/L7CnJLrrCxwwd67rCr09YdNz5pderOUgaxOF7Rj?=
 =?iso-8859-1?Q?3KcQTF1ZCAjWxgt+ShnETtzUPGmhqXKUQqo6V81b65YGROMgctNZ57YpfE?=
 =?iso-8859-1?Q?K9yk2S6I2/Pz7U9TE+RAhav2iq39uX2koC+gV2tU3ZLaEf+DTLHwq6M4Tk?=
 =?iso-8859-1?Q?CS8xFsa1ADqwG/yDp5MW98LgNi92dpCw7ptY8WYsqFeN7fm5DIs502TLv4?=
 =?iso-8859-1?Q?lcKhNPuVjRW4eBhxWWxLlq8ldoSPBygXx0tzSV5GUxZKUdWfLi8o4JrqCx?=
 =?iso-8859-1?Q?KP82LGlpQSKs4+wKGff5YlZjxw1rzTQcKdR2A3jVvZrvMLOhhc48AlNwtb?=
 =?iso-8859-1?Q?tl/RN28jjCc5wQn71RXUetnVed0NEMWH3GgZYOEY56C+AXpq5ci4QbtRGY?=
 =?iso-8859-1?Q?FQQEcWgg69ilvM8bj6UUJhbm82utXcJrf+KH4ZF2TgOXZmle/arWozzAVo?=
 =?iso-8859-1?Q?ljTeTT3M3K3JKjMFsg3yLL01uayM1fsNuZec9IFPgJEcdIrVFyqUL0I1Dn?=
 =?iso-8859-1?Q?0PISInqVXz7hmN4kuFWacwnCgqHZ8xEPE7hmWxiQCcOrYC/ZEHWMaEQq9Q?=
 =?iso-8859-1?Q?3KiR4ox8uaWL93OokLfJz0m7UdrVbc7f889ALzI0?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: swDTmAqGGkKy+cpScJVTLtGD3MKuYQqbTs/kP0V4ZUVTcHpihzoPvCifAyvWZhmE/D8IXSuNgJdekiKQTkYJ6TbLuonmn/vXzsbFkHBG/YCYG0URSi0nj+UcMU5WlrNCON7lK73kjZYVb8JZoTW8YDBUx2aKA0qnlbt1C+rRYBJ/U3AVAWKffR809hrEtcWcRjIOBV+Bg+CZnLqos3Nu55UdyudbgPFidblx4bg5camBymErOZLXHoBGI4t0UEsdG9bXYK50ll4PcaOWnYiXp5HdQvs3dzUXnRPjG4g/49yLRUEzBNsPqdLTRm11iOxVzrENaQTKgm8ishnPrlIfoxTX7PLPegmDL3YTUjgw88gdOGCrYQvmCip3iqX8Vs5YNxsdcIyhCQNoAd4abY53FCME6XFu4K2kDgnS7k720MUHA/m9hY3oAHmddpmVPihZBlk2zutYuiwkakiwnqpw7UWf2P0fbpPh/0tGOKa38dTV73gt7SjWwQqZVAODAynaHaxHgp3kiPJdDF0q5M3LTyk3kP4IQKeSSpQjCcfhj9VrGdhepq8XI+Qt0Jncz1+f5iXzHaZm0SzLDbe9ln3F5PiIRPJVDMKh73L8Uityu5eCeR/ay1iN5d7w8AIENDRC
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a846c4a5-fefd-40ba-c4c7-08dcd96e0ea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2024 12:16:29.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8820279b-c0be-4bde-83ed-fe6b6f9724d5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9saVx1ufzsbEauqZTStAb7hrLlRbUqKnpNFF7wFphnplI+4harldHDuNQ0gy/vu7zNQxV4CxqeBjO66A4XQCZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB3905
X-OriginatorOrg: avnet.eu
X-SEG-SpamProfiler-Analysis: v=2.4 cv=bo8eB1ai c=1 sm=1 tr=0 ts=66ed67a0 a=87ol8jTS2niydCIsF3R5AA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=EaEq8P2WXUwA:10 a=cfxL476SPWAA:10 a=QX4gbG5DAAAA:8 a=sozttTNsAAAA:8 a=xOd6jRPJAAAA:8 a=e5mUnYsNAAAA:8 a=xq3W2uTSAAAA:8 a=ag1SF4gXAAAA:8 a=1XWaLZrsAAAA:8 a=4rdmcftCAAAA:8 a=QyXUC8HyAAAA:8 a=qBWefRT3AAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=DrHOEiwdAAAA:8 a=pGLkceISAAAA:8 a=P1BnusSwAAAA:8 a=8b9GpE9nAAAA:8 a=EUspDBNiAAAA:8 a=xGAvDSoXAAAA:8 a=apL-334RAAAA:8 a=RF00TdSWAAAA:8 a=423JHI7AP41jE9Ii8ggA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=P2XgnWxznO8A:10 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22 a=P5L7wpMTXyg1GfFA3Gwx:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=HxwAgryzcfIrbS1F4ctD:22 a=Zy_c1RO7VJJ7luvY8LFb:22 a=E07at6hw5NRKWWwPwz1Q:22 a=D0XLA9XvdZm18NrgonBM:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=I9AbH5bZuplaqbmfSwNo:22 a=eWIHaOtA_ULHaMmHwLHW:22 a=_nx8FpPT0le-2JWwMI5O:22
X-SEG-SpamProfiler-Score: 0

Hey Hans and Mauro,=0A=0AI remember also on a very little point regarding=
=20hardware for testing. But we didn't go in detail again during the summ=
it.=0A=0AHow do we can go ahead here? Are there some test systems up and =
running somewhere centralized or how it is organized right now?=0A=0ABR M=
artin=0A=0A________________________________________=0AVon: Sebastian Fric=
ke <sebastian.fricke@collabora.com>=0AGesendet: Mittwoch, 18. September 2=
024 11:30=0AAn: Mauro Carvalho Chehab=0ACc: Hans Verkuil; Linux Media Mai=
ling List; Sakari Ailus; Daniel Almeida; Mauro Carvalho Chehab; Hecht, Ma=
rtin (Avnet Silica); Tommaso Merciai; Jacopo Mondi; Benjamin Mugnier; Lau=
rent Pinchart; Ricardo Ribalda; Michael Tretter; Alain Volmat; Sean Young=
; Steve Cho; Tomasz Figa; Hidenori Kobayashi; Hu, Jerry W; Suresh Vankada=
ra; Devarsh Thakkar; r-donadkar@ti.com; Dave Stevenson; Mehdi Djait; Nico=
las Dufresne; Salahaldeen Altous=0ABetreff: [External]Re: [ANN] Media Sum=
mit September 16th: Final Agenda (v7)=0A=0AHey Hans & Mauro,=0A=0AOn 18.0=
9.2024 09:24, Mauro Carvalho Chehab wrote:=0A>Em Tue, 17 Sep 2024 14:52:1=
9 +0200=0A>Hans Verkuil <hverkuil@xs4all.nl> escreveu:=0A>=0A>> Hi Sebast=
ian,=0A>>=0A>> On 9/17/24 11:17 AM, Sebastian Fricke wrote:=0A>> > Greeti=
ngs,=0A>> >=0A>> > I remember that we wanted to still define a couple of =
processes for the=0A>> > multi-committer model for which we hadn't have t=
he time on the media=0A>> > summit. Just would like to gather who would b=
e interested to meet for=0A>> > that, where we meet (probably LPC venue) =
and when (Laurent just told me=0A>> > that Friday is probably a good slot=
=20for that).=0A>>=0A>> Can you refresh my memory which processes need mo=
re work?=0A=0AWell I basically remember that we had a bunch of topics in =
our meetings=0Athat we wanted to skip in order to talk about them here.=0A=
We looked at the documentation from DRM and wanted to think about=0Aequiv=
alent policies for media.=0Ahttps://drm.pages.freedesktop.org/maintainer-=
tools/committer/committer-drm-misc.html#where-do-i-apply-my-patch=0A=0AAl=
so there were topics like how to handle backports.=0A=0A>=0A>I have the s=
ame doubt. As discussed during the summit, Hans and I had some=0A>discuss=
ions yesterday, to address a few details. For both of us the process=0A>s=
ounds well defined.=0A=0AI know that we scraped a lot of topics in the me=
eting at the media=0Asummit and I am not sure about the scope you discuss=
ed with Ricardo=0Ayesterday. So, we don't have to meet if you feel like w=
e covered=0Aeverything, just wanted to use the opportunity as long as we =
are all in=0Athe same place.=0A=0ARegards,=0ASebastian=0A=0A>=0A>From my =
personal notes, this will be the new process:=0A>=0A>- committers will me=
rge patches at media-committers.git tree at fdo,=0A>  provided that they'=
ll follow the rules defined on a committers agreement=0A>  and (partially=
?) enforced by media-ci checks;=0A>- core committers follow the same rule=
s, with a broader privilege of=0A>  changing kernel API/ABI;=0A>- committ=
ers will ensure that patchwork will reflect the review process of=0A>  th=
e patches;=0A>- maintainers will double-check if everything is ok and, if=
=20ok, merge the=0A>  changes at linuxtv.org. We intend to rename the tre=
e there to "media.git",=0A>  being the main tree to be used for developme=
nt;=0A>- pull requests will keep using the same process as currently. The=
=20only=0A>  change is that the media-stage.git tree will be renamed to "=
media.git";=0A>- maintainers will periodically send patches upstream.=0A>=
=0A>The media-commiters.git tree at fdo might be rebased if needed; the=0A=
>media.git tree at linuxtv.org is stable. A large effort will be taken to=
=0A>avoid rebasing it.=0A>=0A>We may need some helper scripts and/or use =
pwclient to keep patchwork=0A>updated after committers reviews.=0A>=0A>Su=
ch process will start after -rc1.=0A>=0A>We intend to rename media-state =
to media at linuxtv after -rc1.=0A>=0A>It is up to maintainers to invite =
and decide who will be a committer.=0A>=0A>All committers/core-committers=
=20need to explicitly accept a committers=0A>agreement. We may end starti=
ng without it at the beginning, but as soon=0A>as a final version of such=
=20agreement is written, everyone with access to=0A>the media-committers =
tree have to explicitly accept to keep their=0A>commit rights on such tre=
e.=0A>=0A>The only part that still require some work is the committers=0A=
>agreement. I'm working on it together with Hans. As soon as we have=0A>a=
=20version, we'll submit a patch to the kernel, to add it to the=0A>media=
=20developer's profile[1].=0A>=0A>[1] Documentation/driver-api/media/main=
tainer-entry-profile.rst=0A>=0A>>=0A>> For me I think Friday afternoon (p=
robably after 14:00) is the only=0A>> option, or perhaps Thursday after t=
he Camera MC.=0A>=0A>I can't meet on Friday afternoon. I probably will be=
=20on another=0A>event on Thursday (Openeuler MC).=0A>=0A>>=0A>> Regards,=
=0A>>=0A>>      Hans=0A>>=0A>> >=0A>> > Regards,=0A>> > Sebastian=0A>> >=0A=
>> > On 11.09.2024 11:03, Hans Verkuil wrote:=0A>> >> Hi all,=0A>> >>=0A>=
> >> Here is my seventh and final version of the agenda for the media=0A>=
> >> summit. As always,=0A>> >> all times (except lunch time) are guessti=
mates!=0A>> >>=0A>> >> The media summit will be held on Monday September =
16th. Avnet Silica=0A>> >> has very=0A>> >> kindly offered to host this s=
ummit at their Vienna office, which is=0A>> >> about 35=0A>> >> minutes b=
y public transport from the Open Source Summit Europe venue=0A>> >> (http=
s://events.linuxfoundation.org/open-source-summit-europe/OSSE).=0A>> >>=0A=
>> >> Avnet Silica Office Location:=0A>> >>=0A>> >> Sch=F6nbrunner Str. 2=
97/307, 1120 Vienna, Austria=0A>> >>=0A>> >> https://www.google.com/maps/=
place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.310093=
7,15z/data=3D!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.18=
32035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=3Dttu=0A>> >>=0A>> >> Refreshm=
ents are available during the day.=0A>> >>=0A>> >> Lunch is held at Sch=F6=
nbrunner St=F6ckl=0A>> >> (https://www.schoenbrunnerstoeckl.com/), close=0A=
>> >> to the Avnet Silica office. The lunch is sponsored by Ideas on Boar=
d=0A>> >> and Cisco Systems=0A>> >> Norway.=0A>> >>=0A>> >> Regarding the=
=20face mask policy: we will follow the same guidance that the=0A>> >> Li=
nux Foundation gives for the EOSS conference:=0A>> >>=0A>> >> https://eve=
nts.linuxfoundation.org/open-source-summit-europe/attend/health-and-safet=
y/#onsite-health-and-safety=0A>> >>=0A>> >>=0A>> >> In-Person Attendees:=0A=
>> >>=0A>> >> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)=0A>> >>=
=20Daniel Almeida <daniel.almeida@collabora.com> (Collabora)=0A>> >> Sala=
haldeen Altous <salahaldeen.altous@leica-camera.com> (Leica Camera=0A>> >=
> AG)=0A>> >> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media K=
ernel=0A>> >> Maintainer)=0A>> >> Steve Cho <stevecho@chromium.org> (Goog=
le)=0A>> >> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)=
=0A>> >> Martin Hecht <martin.hecht@avnet.eu> (Avnet)=0A>> >> Tommaso Mer=
ciai <tomm.merciai@gmail.com> (Avnet)=0A>> >> Jacopo Mondi <jacopo.mondi@=
ideasonboard.com> (Ideas On Board)=0A>> >> Benjamin Mugnier <benjamin.mug=
nier@foss.st.com> (ST Electronics)=0A>> >> Laurent Pinchart <laurent.pinc=
hart@ideasonboard.com> (Ideas On Board)=0A>> >> Ricardo Ribalda <ribalda@=
chromium.org> (Google)=0A>> >> Michael Tretter <m.tretter@pengutronix.de>=
=20(Pengutronix)=0A>> >> Suresh Vankadara <svankada@qti.qualcomm.com> (Qu=
alcomm)=0A>> >> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems No=
rway)=0A>> >> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)=0A=
>> >> Sean Young <sean@mess.org>=0A>> >> Jerry W Hu <jerry.w.hu@intel.com=
> (Intel)=0A>> >>=0A>> >> Remote Attendees (using MS Teams):=0A>> >>=0A>>=
=20>> Mehdi Djait <mehdi.djait@linux.intel.com> (Intel)=0A>> >> Rishikesh=
=20Donadkar <r-donadkar@ti.com> (TI)=0A>> >> Nicolas Dufresne <nicolas@nd=
ufresne.ca> (Collabora)=0A>> >> Tomasz Figa <tfiga@chromium.org> (Google)=
=0A>> >> Hidenori Kobayashi <hidenorik@chromium.org> (Google)=0A>> >> Dav=
e Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)=0A>> >> Devar=
sh Thakkar <devarsht@ti.com> (TI)=0A>> >>=0A>> >> All remote participants=
=20listed above should have received an invite=0A>> >> with connection de=
tails.=0A>> >> If not, please contact Martin Hecht <martin.hecht@avnet.eu=
> asap.=0A>> >>=0A>> >> If any information above is incorrect, or if I mi=
ssed someone, then=0A>> >> please let me know.=0A>> >>=0A>> >> We have 18=
=20confirmed in-person participants, so we're full.=0A>> >> If you want t=
o join remotely, then contact me and I'll add you to that=0A>> >> list.=0A=
>> >>=0A>> >> Draft agenda:=0A>> >>=0A>> >> 8:45-9:15: Get settled :-)=0A=
>> >>=0A>> >> 9:15-9:25: Hans: Quick introduction=0A>> >>=0A>> >> 9:25-11=
:00: Ricardo: multi-committer model using gitlab=0A>> >>=0A>> >> 11:00-11=
:15: break=0A>> >>=0A>> >> 11:15-12:15: Jacopo: Multi-context support in =
V4L2=0A>> >>=0A>> >> 12:15-13:30: Lunch at Sch=F6nbrunner St=F6ckl=0A>> >=
>=0A>> >> 13:30-14:00: Tomasz: Current state of videobuf2, its limitation=
s and=0A>> >> the paths forward.=0A>> >>=0A>> >> 14:00-14:45: Laurent: su=
bdevs, state, and usage of the media=0A>> >> controller device to submit =
requests.=0A>> >>=0A>> >> 14:45-15:00: break=0A>> >>=0A>> >> 15:00-15:30:=
=20Sean: new tooling for infrared:=0A>> >>=0A>> >> - What it is and what =
it can do (love to hear any feedback of course)=0A>> >> - Where it should=
=20be hosted? (I hope gitlab fdo, who do I ask)=0A>> >> - What needs to b=
e in place for a release?=0A>> >> - This tool replaces ir-ctl and ir-keyt=
able. How we phase them out?=0A>> >>=0A>> >> 15:30-16:00: Daniel: Rust in=
=20the media subsystem=0A>> >>=0A>> >> 16:00-16:15: break=0A>> >>=0A>> >>=
=2016:15-16:30: Hans: UVC maintenance=0A>> >>=0A>> >> 16:30-17:00: Steve =
Cho:=0A>> >>=0A>> >> - V4L2 testing on Chromium using virtual video decod=
e driver (visl)=0A>> >> - V4L2 video decoding testing with KernelCI=0A>> =
>>=0A>> >> 17:00-17:30: Laurent: Should media drivers depend on CONFIG_PM=
?=0A>> >> See here for more info:=0A>> >> https://lore.kernel.org/linux-m=
edia/20240825222455.GA24390@pendragon.ideasonboard.com/=0A>> >>=0A>> >> 1=
7:30-18:00: Any other topics and feedback on what can be improved=0A>> >>=
=20next media summit.=0A>> >>=0A>> >> Hope to see you all on Monday!=0A>>=
=20>>=0A>> >> Regards,=0A>> >>=0A>> >>     Hans=0A>> >>=0A>> >>=0A>> >>=0A=
>> > Sebastian Fricke=0A>> > Consultant Software Engineer=0A>> >=0A>> > C=
ollabora Ltd=0A>> > Platinum Building, St John's Innovation Park, Cambrid=
ge CB4 0DS, UK=0A>> > Registered in England & Wales no 5513718.=0A>=0ASeb=
astian Fricke=0AConsultant Software Engineer=0A=0ACollabora Ltd=0APlatinu=
m Building, St John's Innovation Park, Cambridge CB4 0DS, UK=0ARegistered=
=20in England & Wales no 5513718.=0A
We continuously commit to comply with the applicable data protection laws=
=20and ensure fair and transparent processing of your personal data.=20
Please read our privacy statement including an information notice and dat=
a protection policy for detailed information on our website.

