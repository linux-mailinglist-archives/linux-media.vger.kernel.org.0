Return-Path: <linux-media+bounces-58579-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ6cFgAZ2mkayggAu9opvQ
	(envelope-from <linux-media+bounces-58579-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 11:48:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8803DF2F4
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 11:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FEE5300EC62
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 09:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287FB325485;
	Sat, 11 Apr 2026 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="EYk5lWug"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020120.outbound.protection.outlook.com [52.101.227.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C607E1A683A;
	Sat, 11 Apr 2026 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775900921; cv=fail; b=YCqIHEQ55mHgy0M1a7IQXIq9uiLfA5o7lHbPXpwRmGfkaTXVScyzA1kZPLkmBHtHvf58SygDBNfm9DJrAF0uAlZq5TtLJ4hK5J5+K/kvf1WQAgLLRmLVMZroav+tDd4hX32tm7Xxs7kRc3NMu0f68JvsPIps/zgU5Qzp+S/W20U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775900921; c=relaxed/simple;
	bh=VChYMYUmksPO5XFYDXA8LgtQyVxD6j1ky89IysDf+vA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jVCJNL2ct1YBu0yO/gCoGXVmu6b1rZE4MvS9BUA3WdeKLK11dOwSe0zGcxzCZ9s9JtTMGyLtiti3sHVGNxykg5nLyfLVVePRNN6D44481bYIrl53Hi91q4SHLyBuaKN0ngwVuDm08D2TZ3/Wrpup48imWURO2YVh58Avf2GOH/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=EYk5lWug; arc=fail smtp.client-ip=52.101.227.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAdmUctRiYeq2kIpMWLjSqsO2gaFi9SzBK/s00rHHppEYzwEo1E+2hsaKgQOQ8k7QaP4lFVRFcHtoBtBCjjMmsNUFYc60sBZ/x8oZXHfnYaREg6X+lDVIC8y/wfdrS4zWn8UHQryfUffHGARdKLt+5Gr3TZvLVxOzFvb7oV2n1UFC1EELOuSDT7thRrxP1XNcBbFULlm6s9TQKLwKWoOfov/4G8yTz8g7mzpaj5icDRsSJ5fj8D/Np7fe46vOtJfTeyE7xt8YQkfbReWARKWk+CmW2cu4hJPUAXsb2gTNbc0uV2oWiYuRA+f8sik2EALNnuu4v+78T9Jn6p3uroTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeC+k6BSjeboz0MyY3GwMM/GnSOgl3uXft/zNo2qb0g=;
 b=M4OR/fx8gMkWkRU1n8Q0hsitRfndpuLrcPEUCaAeY0hD13+ZtocI1NWFbZdPG03f2vC+1N1RMQ6X3mmxGa5YJ2XmKDs0QzLwC58aU8Hu9Chj0zfssjcHgFC68SPY+uGjcQvfq1ebh1x4g78bubU9xMOf4NsJJUO1VInPZV7lDtT9W8nsMCu3/lo5LCHpl1rEjDFqUkqNHXIs70Qo4x4tQ3/Q8ZcqQMLnVm5CbDDFfNNp7L472aacTddzHHnJ2DahpRqGu3HaOxPUlJl36rJXB1dueKzbgnzX3gtpiMB4/sj70BebpJxZgoZ7duxBk4Rr5Xcj9OSH5GH7jDS20EYBig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeC+k6BSjeboz0MyY3GwMM/GnSOgl3uXft/zNo2qb0g=;
 b=EYk5lWugcg4SA3FJ4HxiF4LiQhEAHigMiF9SvpSELyOGaOT16UOFzkneC5AH/znAzxr1UENQpEd2EGkP3TpsQldEto3wVmMphgc+3eW7YvJTPMN4F7cU+M/WBW+oqFUd/54JO1ctJ3zdg5kqY4hEH1u3BKdjZTIVXM6elPmUrgSBDGveA3faunYMtm+ZeGtN8FFZfgj8BCtIBqYZA8Q0LoYoOxxMqF5qdMSa+KVmyeJfACLXg9eEIc43Tf4qLR8mIX0h5fGIaQ8KjBYGt/7v4tJntiafOcEA5tKFM23pfDyUJ99Godt2B4Tkj//Zm5hhOGmD+4zPzP8VvRSwgEVGMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN4P287MB4782.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Sat, 11 Apr
 2026 09:48:36 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%3]) with mapi id 15.20.9769.044; Sat, 11 Apr 2026
 09:48:35 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	tarang.raval@siliconsignals.io
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add os02g10 sensor
Date: Sat, 11 Apr 2026 15:17:04 +0530
Message-Id: <20260411094723.129738-2-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260411094723.129738-1-elgin.perumbilly@siliconsignals.io>
References: <20260411094723.129738-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::17) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|PN4P287MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: a8db2be6-f8b8-48a6-8115-08de97af8022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	IUVihgNO04UWJYdMg/uomOmszZgIcZBTVf9ks5T5fXS1Kt8+Saen8YcmAz5HOdyUZAwAP/+RNJDaTNo3Q4q9xyugISmDDi7bFjTo9K2BzUjHbKMhEpcFIgSxuQXv9ZJDHq+KOtlspgmSeQrufVfD5TGZl7qeJc6kH+ekeTGH6zXELbVBUZ/75TJNzUd4XQtC5DKtSh7hP2XU4atXdT5mwon+NwsOShki8Y9qFfE2Svc1SOhdSTuZjQspOxSaclP6A012onAmn6bUFB1zk7E+pYfKoiuk/eYOE0epXeRFTGIvmFruIE7/hw5iFSxwFA9Q7YBLUA6QwXk4ExWp9IcXqImsEvGIIm5rCMee4cYWiVSN8wrmTDOs8nYyR4jRZB/L5cuJ3Z9at1Y37kiRbcLNQpzZsBXHRv9mVmOqEAdSMqceEuItasBu7xXlh3APgKebLQLnTZrxnBaGwG1m/LaHGOcNWewrEuTDsjJn3mIeoEk24F668gManMLF+s4I1YkxvikE6EJfPvsIeNUmO6j87/pjNMxYuCpAWoFHSTFQQlM5NgbiK/Knx6+ApYe1gN5wkR043Ms9ltA0UqJ81jcmrZknASnWyl4fJC40klck9EUaQ0Kkjb4faOpmox5zmvUUHcC6LUdmNkGjCxZc5yDnMOCt0RhwPtRKi/ryYJi9rmy83QeO6DrS7f2TkdClkcbBdTtzeRk5nXTFZOKJ8NFd0W6PRRUjn3Al+zLTQZ1jE0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SmAVbMqkEdT5tMjJ4Ww2hdMhC3HuohhHudUOguu3lXPFQEHyZV0z6iMIZDqB?=
 =?us-ascii?Q?/4cnEgwDOUhdgpRBlnLMJnMBVhSRcJMxmvpB8TqHjTnSG7PI+6zBzA8XfXb2?=
 =?us-ascii?Q?7RyZArKYvG5aNqRDbcUMFHyo1DZNvo++KYSZ6h3noaiamKQKowR6FpaZWctP?=
 =?us-ascii?Q?27o0uQf7/4wWwh0+a7RoW+kA4JsgwqFzdoksT8RAeCOyjl2qZ84GLNvCDS6r?=
 =?us-ascii?Q?PyNf2Ucig7GbNFnT9iCiXPqCDjUl9Pfwh7rRuE6/DenfVeJOOEcB3Eh347Z7?=
 =?us-ascii?Q?HJt/v98kBJX9SBIofCs8QcPbZY2TSxInPa+MOJWL+JV0OgjkzwDsdiQiu46N?=
 =?us-ascii?Q?zgfWdYvfenenxxm799x2exKWkXcSSIduzh4YICUxZTL0fVUD57V/YqgPlLVP?=
 =?us-ascii?Q?wG9ounAG7Dnv+DzcP8nrJkzQGhx0uhR3EHOYaMPiuX1aTerOeJQs3qeI9ZZ3?=
 =?us-ascii?Q?aC2AfGzzaI0ofhXbaoaEwlFRqxeSVsHgTIB0ARSKS/8Z9yClzHt06/86F4BP?=
 =?us-ascii?Q?mXLhYx6N57HkiM8INXd1cnNHtveR/9JkNI5cE8Swvr29UPl1rVVHVvPcGG8i?=
 =?us-ascii?Q?03ZPsBhQQjBMXFqqSFtd+2+G9Snv4S2/5xdmwldoINNJA2VALWRALfiXj8ps?=
 =?us-ascii?Q?8B/fooEX+oPknpOKWxGG3qZcMKWQiS+i43hg/MygxNHJklvHnsi04ieCYwg1?=
 =?us-ascii?Q?D/ibtnmidpZakQDKwIi4CnvAaAFo+1NqdYaBwpBkoCmL/0AVsCdGRSEhMgN6?=
 =?us-ascii?Q?lqOl1lj4D8oTBizsbtPD4VN2wNM/io1ARdJHKkhAT1phZQAXJgsoKld5/BCP?=
 =?us-ascii?Q?MJAHIFffomcl1r7GDsPZtDYJTKSzBV5JOxMZ2jQrjpB3dMkb8LuMs1dM7mqF?=
 =?us-ascii?Q?29u7DOgCL2t9PgQwyX7Y0Vn2OmQ+D6kyPVzLz6DlVSWG5tsgzpaslPY3mXbE?=
 =?us-ascii?Q?lsLVEUDcNEcr4APfsfxxWKeMA0uAjOXhzs/72g39uWaQlvgpQu9RrQj4DIjZ?=
 =?us-ascii?Q?aIIQ9yLrySx9CM0Vi+TDnkbufbuWUo71EiWt2MwUl7mUedjsGc6GJqet+8ac?=
 =?us-ascii?Q?RfK0if7D2pMQKYxEncKM9/7hntVanRntKxE2FvCjDeL+9sfILm6nWorBTwSG?=
 =?us-ascii?Q?YeEfd8gt0tPgmzXIQ3HgX3WVUDJx1NxVh2huULSHx4ssceD2S5Uu2/HNDvY8?=
 =?us-ascii?Q?+uhPReKFESWdx4LX04U+DElCbGAgos0E1oXz8GvPfmOT2Cp5FHuVgcXXUnH8?=
 =?us-ascii?Q?jMjX2BD0L2ZTJrdogwj1Vc5Vb5PLeP7n9tYNL8KTtlmN0TGRgZDuGkwrA3kb?=
 =?us-ascii?Q?wwz//AciE4nHTGIjRoVNMwGm4gH+uX+rjk333QPZLZkwT5/fIEU4xJm/gbgI?=
 =?us-ascii?Q?O1WaxNNcnjAdWwYiGlgJNaVokWdd4m3joeKuM8hO1+zpZ9Nsgb2QnpSuP2aU?=
 =?us-ascii?Q?6EMlbqWXIuSCrTr1Izsc/75BLcbrjAhPdqS3Gpa205Gz9YleMFGNBPcTbzvD?=
 =?us-ascii?Q?oZDsqkxu0MuHcIUo5cdR0trOlByirWYrFEXS0JWERoHiMzURu0qC6GfagJu3?=
 =?us-ascii?Q?3uwUkBROk73HIwV/f1DGvGYmRmxgXpctgxE/Xaou528RJE2oAygS6AyfBd/v?=
 =?us-ascii?Q?7mAl8Byw7cRhIflFOg6/CZhjMh/x7tTgg/amoOJkDhha4170kSn0A6pI5V/p?=
 =?us-ascii?Q?TPfGr1PJVrTGkw7pur0v9AOEy2dzBgcc4YNqPnnYiP+Y133fmYxMFTYvfR3N?=
 =?us-ascii?Q?jqRNA/dweXX9zH8tdKqPQCRON990L17Xri6slbm/AANUtHZsmA/Z?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: a8db2be6-f8b8-48a6-8115-08de97af8022
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 09:48:35.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 838Rs8pP2Q7brD+KMsMZmVnf6O4eMd2hdfOQlbjD1efm05a7U+E3gBWGLGS/QWNM3BToAbp5dpqePrDp0v1Pogyns7m1pjo4OQywJpS8GaAHQbLnE63NVSQjvR5gMyme
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4782
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58579-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,windriver.com,ideasonboard.com,schnwalter.eu,redhat.com,foss.st.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5B8803DF2F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for Omnivision OS02G10 sensor.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 .../bindings/media/i2c/ovti,os02g10.yaml      | 96 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
new file mode 100644
index 000000000000..06e2b7dc4bdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS02G10 Image Sensor
+
+maintainers:
+  - Tarang Raval <tarang.raval@siliconsignals.io>
+
+description:
+  The OmniVision OS02G10 is a 2MP (1920x1080) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10 format.
+
+properties:
+  compatible:
+    const: ovti,os02g10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital core Power Supply (1.5v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@3c {
+            compatible = "ovti,os02g10";
+            reg = <0x3c>;
+            clocks = <&os02g10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os02g10_avdd_2v8>;
+            dvdd-supply = <&os02g10_dvdd_1v2>;
+            dovdd-supply = <&os2gb10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 900fc00b73e6..8a0a55073c30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19443,6 +19443,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c
 
+OMNIVISION OS02G10 SENSOR DRIVER
+M:	Tarang Raval <tarang.raval@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
+
 OMNIVISION OS05B10 SENSOR DRIVER
 M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
 M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
-- 
2.34.1


