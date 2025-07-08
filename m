Return-Path: <linux-media+bounces-37083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 095BFAFC84F
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21CC13A8708
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81902269CF0;
	Tue,  8 Jul 2025 10:26:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020129.outbound.protection.outlook.com [52.101.225.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE3021767A;
	Tue,  8 Jul 2025 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751970401; cv=fail; b=T0ghOohybi7eODcsEKKtqRTUtWPcPkwI+1C9e5PLBwSa/DstoKMFsGxErS55HAq5K6WcQ3bfBhQ8RvpfmPQEb6l3ExdmkZU/Xu/3fRspAnN+eU7jf51lFw7PONjMLuNhpbaLi8Dyt+zt17nI1QwRuUlgpeS3uHripX2vH4LE81Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751970401; c=relaxed/simple;
	bh=o7v88BklTWNb2GFVrXyl62OXpJtFMy7YifgJxM2z2n0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XOJVU4OXF7F0xNZRnkuBAkknx85QGKOk+Tokp05cPIr2itFjwtcd63oSUTNnmHrh9oxsliDnEuNl+vXyhsV19ETiEbUOjusl4kADeZq/p88Bh6gGNPK3PXbs94zt0vXg1Z+xx5pa8sOXMAKLbYmioOovb3yE86yw8oYCsaYRBek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD/pPNjQY4mFJSI+BeOvslm+fCwXMA4kqaeYGO0mZdwBU0AscKtzD6YMRsmpO0mblx3By2HrEhyCH+IiICRJgRqaXD3lbywjVLsNhoKvse0kMNQVXP/+otaEqQgcIa6G1vGoSvxxkq9/u/Rnayhdt9uKIDy98Nhdx131z//yo/lSDTKjzmCU6pN09sUb4jb4He4Gsj7HosoSmvWpmZ4keHL9fyqyVKV4D+16tLto4fzZayEfuRALpxbxc76DtUJvAFsNkXo6KmlAsKWBcXsgirl1W6RXrIebnC4HmArXg03u0yrQ7tIGlhGvacajzAhuHt49Pw6O8y3IotYkeuqmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+shTCWlG24OjLv6R6PxTZm5o0fMIO4MrUtP200/YPo=;
 b=qgEafU6K4otrSwFtqtVWWiU7OKWc794ID1uKEPbEjMpvLdJBNVG3yutONd4ZtMveN8G4U03NBtylptPLw3eupNWYW1CsIak4YpUnInFBzKZRAGufwftR6y/Id56zjeS58QEW/lY8IlPbXHO+LXVifgP+oOlExjA3KK8HIDbeJiOT8HKtwpEbzds/kUW9qF+LoY2CIaaRGsLczJPP/fir/9QS+x3m2JsGCXZw2pMo129VsTHCRdOTLH7WoRPfeNRnOzfcFVywFI1YhSLMi1Swex2TyHRM+bMmHzyBeqkae/N3CLOgWed91EOoYu4sPoCa2R+6njbnYIi6SAfG57NBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MAYP287MB3738.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 10:26:33 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 10:26:33 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	krzk+dt@kernel.org
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Matthias Fend <matthias.fend@emfend.at>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: Add ov2735 camera sensor driver
Date: Tue,  8 Jul 2025 15:55:54 +0530
Message-Id: <20250708102604.29261-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::28) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|MAYP287MB3738:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b43521-4aed-4e99-28bc-08ddbe09e90a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rFMXZoG42/YrZoMb6TILnf8Aq1LCjQ+Eyv0mdupmUtRx6XzldCWKry+a+Mj/?=
 =?us-ascii?Q?gwswLZ5hndaU0g3dZ2mSE4SzdhiEaRRk3OSoDlervlDzcbI6GvEDiXjPLv/w?=
 =?us-ascii?Q?NwtdZJNle7viHhRalZGKRD4ntw6BTzAAa2bvL80Av9vmxfFDDHVw/31g3Mmn?=
 =?us-ascii?Q?c9iPZM3jQ9RDeO7Neex/hwFI822tOG6sRTulepfTDocMhUnyC+1XdYihuh4x?=
 =?us-ascii?Q?1ZArTyJbudJxo2l7/MFgkc0h6yZXvM5SrDITWcqMDC+QoPAhR1Uc2tr2dp4h?=
 =?us-ascii?Q?iSeNK0GVe6stTHKSj7kmdhUCHy5OT+GB04ht8zV2VBxtVVLQm8rcWmt7KW/V?=
 =?us-ascii?Q?f4m+w8MHKQgt519TUPqY3ygharuphEAqM5fsAfkzRjSWmFjiQYTuqtGMzMlb?=
 =?us-ascii?Q?gcXsdW47oMdawhHExGDynr87xiECIg/cgJD6NVuathJhylS9CnwUmh5SMCm7?=
 =?us-ascii?Q?dBXM4GDfaQfaD5IPPjT5dLSzSVH21wLzdJ6PI0crvq+tNWxcAjPtf+qUXm97?=
 =?us-ascii?Q?elJYFFmMf6NEUfTExt1KCBRzOW3XvUmWpLy19eJtUvBfy8TCdv1c+05VH8vW?=
 =?us-ascii?Q?wPLXjj34Nl7qwm90iQquUCoYjenr0TDv7goFnFvWnXig8d1KlF869WiJHG15?=
 =?us-ascii?Q?cLDx8mAdQNZvTtpFqI+JYkEL6Smeb2ym/VG2sKe1Sqyc/YgrwZ76RSoVpG9S?=
 =?us-ascii?Q?3v6jlvfKJ+XX1blAiag/OxyCRQhss1xIPGWZHXSdMM5L6EPKYybXkXc7EfWV?=
 =?us-ascii?Q?BLQ2r3NoadcBky7Lol5GvVpsl6KZr+lNZ0yvHLKWE72Y3i6t3XxEHwa8QuKj?=
 =?us-ascii?Q?IkkTk93sTP6JkPjG7TCpTmvrkJdfXnFZbBivlfWabuOv4OZ1Pqdz0+z5uo3H?=
 =?us-ascii?Q?3ciYQnRkaXg7HGj1m8Ceaz6E/GeWW38Ysets2uD7BUbPM2Puls+0Fhud7oZc?=
 =?us-ascii?Q?QFC5ZrIvCnegAU2kN24k4cN42x9BVtVCalJln+y8pKuXGN1qwCvg5h3mZT0t?=
 =?us-ascii?Q?G9s9S66elgX7mJoAovYpiPR91b7ThAK1FRf/UqNjCsmyBMa+FPaIt7ZIvBSn?=
 =?us-ascii?Q?oXrD5x5lIhWyr2ozD75pK22wXlFjZLCe61Jr6NZ6yq/1fVhj425s5a1Uia00?=
 =?us-ascii?Q?yhLi8SuJWxcbc9E4WAHfSiu3AzaXGCcZJOxP2c5KE6WO1N2HmeVaM4y/eOwD?=
 =?us-ascii?Q?TDBzdVmbQvq9vymaIiRE13uuN402PJIMQrRMEOFjiv/QahVHBkLFJS1QU9zI?=
 =?us-ascii?Q?MmaAA2k1zww/VBncojaNoDa6SZ/8Oai+UViEfUcZy7rc3nL/cjQMXaSiOL0k?=
 =?us-ascii?Q?jaHNwexCA/gPSDKXmByAN5C+m4buzD4mBM3MWrF1EyWzh2JGgNkLN1WYxYKe?=
 =?us-ascii?Q?HtxpQH+yMCygsFzzGyL2W6ipjmB585fg3+DMfSM9Lka5a/YGuF6ufbCmnwea?=
 =?us-ascii?Q?W6Sj6gUHMmCgXcxPKydoDP1XpPiDku2oIx5+TfJdlTyKlhzBWRBP8A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V2cb/YIy0mgn2Gn9RgfGJVxwvOHbjw1RQnTK6jmO6lAf/t/IgaCBdncftLG8?=
 =?us-ascii?Q?DfSu+l1kRprmqT0fV53PZCdD1UZsnHzgu31j9nSlHAEINM/0AS8DDzfTH43U?=
 =?us-ascii?Q?ifDXcA5L6yfc1Jy7sO/U1+fRHSf7p8vi+9W89GbCG5hsqZyPisiiHKK/PVyY?=
 =?us-ascii?Q?YwE0qZojzxR2+ug1pIioE+mxXcqC4aoI6toH4ShKxTFxre6g8QqIlVZCqxYt?=
 =?us-ascii?Q?gGDQ9iBwrnSri+fD/Ge0dk83OvNDFFGdcfFJYSbtoKqaLp2BNLj3RNieUdsd?=
 =?us-ascii?Q?sEJ138ilnhwNmXxi/1GtlqdVyRV55LOpwqmQux27EcX3Zzz14Vy7g4zQSSmX?=
 =?us-ascii?Q?2bjiUdbJaM4KhS5dosMKK/zcWuOCqQ4F/RfGQDC/38fk3fehyaHbZD6VihCi?=
 =?us-ascii?Q?W5AhHDTuUp8o+XairWE6w5UFvutZq38nI9JATQoZRVMQOKmcMgoKrNA9TMkS?=
 =?us-ascii?Q?KoWZyTw3jiyG4p0hFLahg8r+yUGHqqVxHg4fcFqxZvBAqzXkl965wIwnFxgF?=
 =?us-ascii?Q?y9MGzaumBxuGqTYMuLn7c4koNK21jQ9Mxu5VQCtHeQrneOIoW28IhdVALVAc?=
 =?us-ascii?Q?Lhu2QcPNgULj7wnZg1bJxjGhlaEnWF9zjMiYHx5h1CUWZ/iebS3HH15N2ajA?=
 =?us-ascii?Q?Hy05KVGNKK/2SX5IPg99wU6AVwYe9ttdvt5fKjLeQSp0EhGyT5M2UVNz8b52?=
 =?us-ascii?Q?5YV4VZZm3dYOxO6oCliJJfob4BfYBfGg+kbJ4E2wHFwQmdmyPfmhGzIv9R+D?=
 =?us-ascii?Q?OFd88hHVlX24O9U2AXPK1O0lGo6gbXeLKZSFl8MHkuXTUHDIjuMpmx+s8Gxd?=
 =?us-ascii?Q?Svt74GyYuLsKGYeOA9+eX7C1diTiIOzioyM8IygUiGYPeqLw+08Aa4aBGY8y?=
 =?us-ascii?Q?tLsY/EKt/v+1hzjRLauhnPOTUuttuRHcT2G9/IRhytBwnroqmU31TmB9ex9h?=
 =?us-ascii?Q?xulJbN4lGvanLBlJzP+glDVJHU0JIOqI1FXnmW4emODlo7C5YTXsvdTQ0qen?=
 =?us-ascii?Q?lhR7VqspH3u/Xdnx38W//xPbD/G/SKmKFHmL9frebyrVZ+vi2qQtVkNHLWqu?=
 =?us-ascii?Q?L2ZjDCvi8aoelDCTpUb0qCyFytSrzH2O3RcHwDgydgw80YnO4TryIBuHhuPL?=
 =?us-ascii?Q?mkf0OcczunQKLB4HIB240LUUc1YsQTQXBtsJMi/mL/onAFEzcNgZKhJdtDOO?=
 =?us-ascii?Q?CgOnTUM9UEIXjnT3OK2Mvy7caEpLqmOzqBmUQ74EAERyjpfeR49s5ock7l7M?=
 =?us-ascii?Q?+exTvzcO4re6n0OqZF32Ldd/IgNqbGC72uQL3Qgq798aZ8JqPLJ5mkEVkUFo?=
 =?us-ascii?Q?EDqBV8XPv+FztK0JIvOTv1GEONRjPtgvlj9s4w1Rfjaz5TdYqwTkUHrUS3iZ?=
 =?us-ascii?Q?b42Wbt77G2tjXE7lTETA/9aNvP8b3rhKWzysZB4EnfQ/V11OBE/kFI/BdBMj?=
 =?us-ascii?Q?ZwKSm2vZQm70Brg34zCTQQyysSNwMhDL6K3w9Z2HmYCGhzJhm/rwI8V8lMyP?=
 =?us-ascii?Q?UXgbAR9vrYCcYCYtmwypDU+iyW3+UCPLLEXNK5DjJtL6MDaZU8mSOrph6C9i?=
 =?us-ascii?Q?3hL3MAnzWHMV9SGLJra3rtksfSq9lO71ObI5dRQpVujKzRE5W466e+JKLKCR?=
 =?us-ascii?Q?Z7N4ccQi2abaeGgb2LEW8Ps=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b43521-4aed-4e99-28bc-08ddbe09e90a
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 10:26:33.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaiN4h84jN2OqkpvJtzs6hJzjyR2BA33lCjsWuTeEA0FFin+qrqgxCMbaxTJPzp72T9ViEjG7SGTUKjlAqKjrktMvZkRHejc1vjk6Rbzx+htbEvOcbfE4Lbfi9bfQjOS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3738

Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.

The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
active array size of 1920 x 1080.

The following features are supported:
- Manual exposure an gain control support
- vblank/hblank control support
- Test pattern support control
- Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)

The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.

v1 -> v2

- Added necessary header files
- Corrected indentation
- Used the ret parameter in cci_write and cci_read functions

Hardevsinh Palaniya (1):
  media: i2c: add ov2735 image sensor driver

Himanshu Bhavani (1):
  dt-bindings: media: i2c: Add ov2735 sensor

 .../bindings/media/i2c/ovti,ov2735.yaml       | 104 ++
 MAINTAINERS                                   |   9 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2735.c                    | 908 ++++++++++++++++++
 5 files changed, 1032 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 create mode 100644 drivers/media/i2c/ov2735.c

-- 
2.34.1


