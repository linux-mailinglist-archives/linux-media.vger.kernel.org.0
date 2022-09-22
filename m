Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7DBD5E643C
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 15:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbiIVNvy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 09:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbiIVNvq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 09:51:46 -0400
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 22 Sep 2022 06:51:29 PDT
Received: from esa2.barco.c3s2.iphmx.com (esa2.barco.c3s2.iphmx.com [68.232.151.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F65CDEA3
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 06:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=barco.com; i=@barco.com; q=dns/txt; s=ces;
  t=1663854689; x=1695390689;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=IwI449vG6EP1VPMAphlMWpIeLDyy4GFMUcVDHX1usFs=;
  b=XmE87e30YHtpFHDq3+ZxaPwq4RdZwo1jvlfjvZiPk7FSn9Ulxvn6FeKd
   noHLY7oZ7T2jhbpz/GL/KGxn3qm4ENYllhbTDvX/v3ozU8fJ+IuCZNK6a
   Jvf3i3jm5zCar7/gHhaC8LFRlcxN3RSkprimS3d91MpgfbKvizBO5MK6Q
   sR87joylJHToV5nSS9vHNfCBf2liO9waRB5IKirD7svQnRXQN2E+32xUC
   IRvEU/nI6qM4VFM8oXwA1KbpNo9jJWGGhhss4PWzWqDL2SHKnDjv4CAC+
   QvYx2LvpMyRsll7deezhK/g9e9up4bABzZIxfR7xNGNn2oPLoc9SN0yb8
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,335,1654563600"; 
   d="scan'208";a="31166466"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcWsdSA2m+qmL4jCM6fuzeIe38yz58CVAJIG3hd94nBN54UITDnctwxt6igdK4k0L1CQmT9Dj4l0Z3aSYEe37TFBCZTnoknDnf1r6fnis0gF4nHr2gPVkpR2AJGJZzX3MCqvvlcqOpaHD0YS/g1ys8TmFSZlgSXkHwFUUvRmTot/vl/TXiK0wja0kyYBB221dausuT3XBQ/cYXc2MqA5QJu+EHz0C6T9kMVA4TVCAmjRrJSYa/E88NOgDxV2EjoOBHAxJJYflWYamHH/LIBekATv1Z5jsRxHgu8Tg8rpLkpQRzsZ2DWuoQmA6rdn9lL3a1xmqKa7HRTaCxrtEme3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwI449vG6EP1VPMAphlMWpIeLDyy4GFMUcVDHX1usFs=;
 b=OCYqPDXz34fygSrbQrw1Jxo/iIkr/trIHeYPYlEsmchjNgWb0WEdSKpjPWBtSVQUdXtP8osGE150FTjyHUJR9a+J+WHC3csGoOA71GahrTbufSKE6ytssOr6ub5HXQ6J1tGKS0NAhM3ozZlGk8wTDQB7ezPcyz6vP9JN0FqSPw9hUxenxABbA+9BUyiE8mzF7tKjvkZuCNmD9mafkseN5X4PZXmIqtoJR7M/65eMfIcZMKfdzEYd0C7YL61pocptKr4C8iJNQSWWV5x42Dvj4KHdJgoAeeUHrNdiNYge2sLV2FL9bPkF60QbhW5DY8RnRTFsDSKu++qrQwwxdIoi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=barco.com; dmarc=pass action=none header.from=barco.com;
 dkim=pass header.d=barco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Barcozone.onmicrosoft.com; s=selector1-Barcozone-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwI449vG6EP1VPMAphlMWpIeLDyy4GFMUcVDHX1usFs=;
 b=N07WdAehvaAQ9x00y/ZhNj35ZWKQlAwox+PfQvIQe+cSY4T8CXM6QVKywh+DTrWy2anD4GV8VrBrswo33DfU3VWhQpsLpBdBUXgHOEvhtw61nr8WaPHRFK+tTELpzVM1RH7JFDFZ7RrJ6AVxuabs8ohZ+kDdHytrYIyqX6qpuUc=
From:   "Rouchet, David" <david.rouchet@barco.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Subject: Issue with Marshall Camera on Debian 11 - request for help
Thread-Topic: Issue with Marshall Camera on Debian 11 - request for help
Thread-Index: AdjOiiSPYI39AWtlQ96BCDBjYVNyvg==
Date:   Thu, 22 Sep 2022 13:50:18 +0000
Message-ID: <DU0PR09MB590505740FD1B5B1C21D7425EA4E9@DU0PR09MB5905.eurprd09.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=barco.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR09MB5905:EE_|VI1PR09MB3598:EE_
x-ms-office365-filtering-correlation-id: 1fd01cdb-a094-4bf7-7bb4-08da9ca162e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NCBTGLUNmPb5jpLJFFEUn6Sj4uKRv7TsJ0oOHoSp+xCQ6RaaP96Ca5NQhX8ZpPnKn2zTrihKGn2IFeJF1Z0y+LHMK2zgPOuZEBY0K7fryqoY4QF8BDuIbvCBNz75nmp+JvSDfvI0jcVS93QXHxt3wbQAJAggrf3wJM9b6ozAYvkhAL604NGacpcSZrohXNrVAjQFPCmbz35htO5l2dscPCXqnCGzptSx5sDoU7rMoK6tK+uZgvaeRlUUNb8ISRuYV10gmcpt3qgU14i5Nz3+NMwjwQrRkXTRJIycuOOm0tFZu1786nz3oy9GdQjfeXD4Ct224RieQoy7fFIK/99eGvXTQDp6sQQgKghPUtBgfgAaxzPa5VpbTviXbYR2GyQiUuu5Rk1/o0+KuQ7rOzsN005QPKHeLecDO2Y0qLt2h9qX8AOxdPxz14e04LHbpd8TjjCL3z7B6hOLPuD6UaTBtdmKmGT0f9FWUcRXpgxyjCGtfyd+XslZCzhvuL2HaZpP+yhM6fAQFEcuAPzCoNRWfRsDJ/+23EqAZ0k/hUbxzwbo34TZ2fXvc8ugfejReFbLnAC6cG5eIPrScOGnXCyp30gcAlL2DTspAp6tznrn8sB94/UGdPmOonR0oDP4p7+Lliur5EIGUDZZC0vbiw0XybMDYuXyFJpU3NqfD4J6v8DK8CyS1nK4dMnuyUXYN54qXTBmiHjmSjR0K/wtCXk1ZuGf9mTw6ouUhh+VrYYAbMHgvrriUE7EMw/UsRpkLDPaVhtkcnYE8q8xpQ3APk7jTQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR09MB5905.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(396003)(366004)(376002)(346002)(136003)(451199015)(186003)(71200400001)(38070700005)(9686003)(33656002)(110136005)(52536014)(8936002)(66946007)(38100700002)(64756008)(66446008)(66476007)(66556008)(8676002)(316002)(86362001)(5660300002)(41300700001)(76116006)(122000001)(83380400001)(55016003)(478600001)(6506007)(7696005)(26005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3q/325O9BJ6Nw1ogUKp0cvh4jxShfRJo7+X9g6okiG9IE8usOO5dv2pz3C/z?=
 =?us-ascii?Q?JTAwAYC00uXiVMOFKgblNoaU8LVomovpfNbiOzUV+reMa6CGawW4A2PPpk4M?=
 =?us-ascii?Q?M8Yzle7NHgnOy5R1+tfybrheK5nCMgwwcT/kHRayFfeKeQo9Cd7+jGE2BKMg?=
 =?us-ascii?Q?JdcZD+NI/jqbzvUG01IKi54Ar6Tsz1zK+/+qJQiZyygi5vGx1Y40n6HKwgQq?=
 =?us-ascii?Q?j0/FUrOmYp5Y7NXaVEuKnWfP05osPvFeLs+be1YASUOd30OTv1M+0SI5GgU3?=
 =?us-ascii?Q?kUZsRzpDd0vdCJlNHYthKEjE5oy3Jva1jC80IogZa7HgTbbz1Q7Q7ohWzX1l?=
 =?us-ascii?Q?CmT6z+9SiVrSuMZ6eturCr1bGivjucTAMh0pqVWkWcZJs7F5BUnzcP2REux4?=
 =?us-ascii?Q?63qOEQ1vTiQSYUnFugI3Y5iMubuSl5wwbVnB2R942tc+MXDkrSKnha95Iju3?=
 =?us-ascii?Q?BQuib3KHJgd17lexIJK6U0oohVxHHisyX3+byxDjvosvtWypiBBYiKomSWcS?=
 =?us-ascii?Q?uVq8xGMw5BN7P9PxoRqCP7jb/jWF8iPwQsyCEThL44HL89ujfQd/oqm3v0CX?=
 =?us-ascii?Q?mnL5WdyC+YU8k72xR3vhyKHjv+ixcSfbqsJdRYdhXSeG1hJbt6zXcHe7/hCW?=
 =?us-ascii?Q?QhwOBcvxjRx6E0yASEXG41hgE0Xw5UscBEgmHVv2qDV5AkVQYumqWrkagiK1?=
 =?us-ascii?Q?y7rA6aSnGlTLXrR0EJHPlAtdtk0u57MHboY6hLbKIt3S/7lafrSSLH/HRAcG?=
 =?us-ascii?Q?ZnPEtThKVNXDsT4CtAkCLawKxUQ88Tz65VqwSNrRO/VsklmGmTKpt6oViy62?=
 =?us-ascii?Q?Ck7lHKdFBIOny5OmDIBL2/PxHjCX3SWoTXyvoarfgv39rz02gQXjGCDmCEfL?=
 =?us-ascii?Q?y8r6swO5kEhrZ15dU5mLn7/blB6SvMd8cqbAwi2w11wlAFgVnGdh0Hhyf8dI?=
 =?us-ascii?Q?er9o8PLNIavoi9DGDg/D9eARrWTBYPDPIuVgHLnNUPtDTez/9W3yqitjGX0N?=
 =?us-ascii?Q?Gmvzmyt91JMflGawSsCeggSCRxpvk4WhsHT0o7wHa/Ty6haA7BEgzTdjnwrw?=
 =?us-ascii?Q?75RT1h29OwV66ajDnO2tMi2Mdiq0vXx/yJmdzkg1PH3sNY58aLvN/Z9HRf6p?=
 =?us-ascii?Q?oaxOQgDCZdYGEg60wHA2OKV140SpukwxUfsJ2S4bhQN7aZ4Xuc1ELnWBrHI+?=
 =?us-ascii?Q?q2A1HdvWHVkMxT4F8DZHk+gciCkHvtQ7SPqcmx54HFhr1/IENNUU2XbWqh59?=
 =?us-ascii?Q?WEzsVVerW6tbvk337qdODpkJnoh9ZuR58Tqa9r5KVSzGU8IVhuS5ST3byhvo?=
 =?us-ascii?Q?Td4tg2TqCBkV0MMeR5GNN6/C7U02FyE3MyqCVsE41SJkMx3aUZ4WfssqORHf?=
 =?us-ascii?Q?QbvNmXLuQmjIEgU9Ujndd7XJZKOvknRXTB0NtyRtYhpj0oCgW24kyTEuZe5V?=
 =?us-ascii?Q?mHtKkiJHBOQkSZcSzPTzh/06El6mkNJ8MUX3PSaXIorHf0VkOaSrACNcDLgH?=
 =?us-ascii?Q?x+aqpCtLwaZb5WnVUMOtl26g7/Ai1WF5cJ0N3IE1eoLxXN5ezS8KcHXhZ+lJ?=
 =?us-ascii?Q?W6DSUNKeNMb08yOTi26X3Baw5jFRCu2WDDAL/Vr1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: barco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR09MB5905.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd01cdb-a094-4bf7-7bb4-08da9ca162e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 13:50:18.8646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: aeb84c91-6270-4446-ada5-d71ceba1d535
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDtJXVUaJI3HAR00m+Ml0lrldD5P2pXC9ybjJreSI6ol19oazXQ21tZmVkVq1hqQk7rahYLnESFg6ybmkXz5mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB3598
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

We are having issues with a camera, namely Marshall CV605-U3, where the cam=
era stopped working when we updated from Debian 10 to Debian 11. Either the=
 stream doesn't show up or with a very slow framerate.

The only way to get it working is with using a script that reload the drive=
r twice. We have contacted the manufacturer, but have not gotten the confid=
ence they will be able to identify the issue, as it may be related to the u=
vc driver and/or USB 3.0.

The solution we are developing is making use of various cameras, as well as=
 other A/V devices on the market, and so far this one is the only one that =
doesn't work.

Long story short, we'd like to see if we can have the help of a specialist =
(the driver writer(s) for example) on UVC driver for Debian 11. This help c=
ould have different forms, up to purchasing consulting time if required.

Let me know if there is a possible way forward.

Best Regards

David Rouchet
Head of weConnect R&D Program
E mailto:david.rouchet@barco.com

This message is subject to the following terms and conditions: MAIL DISCLAI=
MER<https://www.barco.com/en/maildisclaimer>
