Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECCB65F797B
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 16:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiJGOIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 10:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJGOID (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 10:08:03 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715691162D3
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 07:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nb3eh2Nh7rvVfs4VLvRNjT623gvRnQDGrygiWL7AGgJ6lqnV+m0xYYnqQixI/r3Ir8wMG/p5yaGJNTJeVR4K3kd3xDoxQS6fc376/slvW7vI3WBoVNsdiMvDlpw4acbRtpAuk2NrQbVeScsd3vcduRklOdo7dwDnrw5d1ZvN02flhU4iwBiLyFX3hE8LQ7yB6TbLI8hozfnOTBd+/93iEIg915NZgcdAaXJhKotxyBKMyrX8N1LEeNQx4gxhOSJ7bxZnJeq/BMigCZnjbqx9eI1m2TZhqyGXjJ2cJQ8L4l8UtveCfE73UacN1SOhUyMVuYhYyQbesfy4KWeYyNzt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfWd+6AuxRY3psPkQ2UyjwYNZpBAwRvRvXbCJuV0k5E=;
 b=hU0gDc80FkL/MKWoEm3i27pWq01iLLEDDF2It8WsRGUgCK61wSVzj5Dpl8oDysOYp+O7xdyYVf5qqZP2Fexg9UoPSY0efs952BfHBACiGtE6Qk2MEeL9XHS+hS69VFiMJQ/nlj+kTjPF8ZCui2i7K9gB1AaUHTpxf1FlD4VJvDH9z/EPXEh/yPvnjm1CpG7BRaBvSNwVHjei07fWU/iWXPS+Wu/rJiekjRoQd4cHv20t6qWi98dql/bHgFx75QKuJf9UbrUmuhVxeXe2rpPhvTUUHNl9NK/HCOlvTA3Tdlv+WBugocKzSyISjmc1XNUq5WpSY/LKGc5ejH1+5OUFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfWd+6AuxRY3psPkQ2UyjwYNZpBAwRvRvXbCJuV0k5E=;
 b=PbqJ45a3UXndKyNTbdr+2ZP3PbKlx5pVQ2XuogB+z1lNi62UZOAigi6U6FkIVUdqYmx/Qk1Bpjpw0zN04JT0zIS+mZi2WQmCtAyX5af3J4xC2Y6K+9LhobACCOYa+ddlitmRmp4NFQhyImXboaKFxgTxAkak2AB7TZBD/VZh7dE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by VI1P193MB0639.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:147::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 14:07:57 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 14:07:57 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 03/10] media: ar0521: Set maximum resolution to 2592x1944
References: <20221005190613.394277-1-jacopo@jmondi.org>
        <20221005190613.394277-4-jacopo@jmondi.org>
        <m3mta85hbj.fsf@t19.piap.pl>
        <20221007124223.efwyytczaodthygv@uno.localdomain>
Date:   Fri, 07 Oct 2022 16:07:55 +0200
In-Reply-To: <20221007124223.efwyytczaodthygv@uno.localdomain> (Jacopo Mondi's
        message of "Fri, 7 Oct 2022 14:42:23 +0200")
Message-ID: <m3bkqn4thg.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|VI1P193MB0639:EE_
X-MS-Office365-Filtering-Correlation-Id: 60111b7b-dca4-483a-7ff0-08daa86d55d1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YPNAeg1jN+Aw/XcFSNHkJ48OcxzD3nHg93BGP/ca68ST2vIHNqzwwoX0LHTpRGo4iZASxt0mwR7mnaeveSJTKEtc0zfjsKh+4X6cECKXDM5ihCxipLFtxu9Q4FFFh58xsW07ziPO7wHs9OV1kMBRP1nKCwABFvl0LOmeRxqxmpU2H7tr8gaKTVZry9co3XomE3ydQXvs/o/nA4W21snjmOcjftZkGVlfMa6WofTxNq6bhlXTyqrfXDcYxyVv8umVX3G1bTpTPd1OZ22PI/YLTIlNSA0ShStxKn41pwap/tfwAfVi4Yw0jRAxCh2IGMvsEGphm2PTko8IIcPabjpiQ7dVW3IwOZlKy1NFuaXXpKFXWoDChU40eA/Nb9KgvSopdpmv5JJMhgSbuQaZbe7D5NU047XfAeCew2/yxhet7nC0NRJJ6Mw9bWFo2JbzwPOgG1y5fCPujP13uisXHkMMsdu5r88CNPeJTEYVDGVt+qhNyedqYZB6/VXQ7nR8s0r5cZDYRp+AHWAVx2+JWN8VzeXUeCU71HBIZLbFf2kRvKIT++73JhYBMnznjbkHL6Wbpn3N0b8oMiBolEr+aQb6NtY+75dLydVjSFCnxbAGbjLG7s/jdDvWGAtqKu7PjhNpptv3OcqDjb0Nsc/923anY4X49UZCfQlqHBJWx4h5hbUFDJ4j5VkVpak7BwJkfhBiOsOxHJl4pmBIy09GXks0HDOsCCL+2ryRsPrWZv13lDguoLZsN2TpoLRPzAEFw12DkqV/dCVsf3N2hZdUEXiqug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(136003)(396003)(39850400004)(451199015)(4744005)(54906003)(2906002)(786003)(316002)(6486002)(478600001)(6916009)(6506007)(26005)(8936002)(52116002)(8676002)(4326008)(42882007)(66556008)(66946007)(66476007)(41300700001)(186003)(6512007)(38350700002)(5660300002)(83170400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHVhcTNtRjdjRzhBb3g0V0g5SHpOUnFQbjZUc2NyS0dhYUlHczUyNDh4b1lq?=
 =?utf-8?B?TFFWVXFjWHdMejVHZCtqdXA1TnBoSFBHYXhjSGMycGpmWitRbjBmdzlRTXZM?=
 =?utf-8?B?NGZFUWFsOGRuNjgvU2hyREVBUi8wUGpKaS9QRnlucUd0R0lVY0lybTVWejBG?=
 =?utf-8?B?djBraTZFeGVURnRaNTB6T2dPZkJ5Z1I5bkFkWHZ5RGdoMHlhbExEenNpWTVW?=
 =?utf-8?B?OWNUQ3VnUUhldmtzZHRFbEtvOUtuZmhITXo0dUFoV2ZlMmoxcmRkM01tRFpS?=
 =?utf-8?B?VVM1cllNSkhVRDRKNllIbktTN1lJaTRmM2lFVVJVSnZHSlNnUWVGS3VGbndG?=
 =?utf-8?B?blYzZTNGS2dmby9BdXM1M3pQeUdWVmIxN1hkZnBOd0ZZQThTdFNsM2QrbTZP?=
 =?utf-8?B?STRpMDFXaU1ITUtrcjVGUDhHNXFERDhhcC9tczVxdDZyM0hVUzI3V2hGYlp5?=
 =?utf-8?B?ZkEzK0h4dS9QWVM3enUrZ1VvZW96aEhRMDZ5cmRRYjdMZG43VmpoQ2gzMEhO?=
 =?utf-8?B?M2ZkOTJaUXI3TDBHRko4NFNnRGpmRDk2TUUyY20vMnpCQ2hjMVQwL2FXalM5?=
 =?utf-8?B?eVpFNDc4dHB6S0drNnE2WDhWZUg1NkhSakI2WE8zYVFnM0IvTGJxUnBiWmZK?=
 =?utf-8?B?Z2gvNWZjM21ITjNHbm1NU0dySDRFdWRFZko2RHBvNlJ4aWVLOG5ZYnVrUDht?=
 =?utf-8?B?WStJNGNXRzI3U3VhcDd6NVVLbjV0WHZpc21SMVFIYkQvNTVTa1RCQUw4TXk1?=
 =?utf-8?B?b09PMUZhVDdPUi9UbjAvQ3dSUG91aHNtamtBRVE3OVFvVHJkaEsxalZuUHZP?=
 =?utf-8?B?YlVHK2NZZk9tai9kNzViT1Z5bVNkdmZSTHRTVlFyaWhlZ3lKOXZPdFl6M0M2?=
 =?utf-8?B?ZHZTZmdLMzI3dWsybUNmTHFZTnJlNlhBQzhuNG9PL0VTWDZRamZqR21uQmdp?=
 =?utf-8?B?QndXSVFxSzBpU09ESjRuUDlYMVMyMnpvOFYxVGNreTZRczZOY2Vxb3RUY1Zj?=
 =?utf-8?B?blV0VW5LdkZyQ003QWt1NmtJNTU0WVBKc0JSQllMaDZCNWFJNUxhMVUrZ3FD?=
 =?utf-8?B?TUhKbGZibCtTZjdNNmJQdEFzRnVGN2o1dG9RQjdkSVZRRHdvcHdnVXpwM3Ez?=
 =?utf-8?B?azhZNjNta1N3TnRmMkN3WklnQm9vRi9NRGg5UDFXak4zTmFieUd4QzBXQzNI?=
 =?utf-8?B?dWZFdnUyK1JXcHlEcjVkTGJFN1dmUDkyRGxibkh5NWcxeVFOZjdpTUhLbnMz?=
 =?utf-8?B?UlRKSWY2QVRWRFpXSUVUMTcvdTJvSldMTEdUdkdiYU9ubTA2V3M5aDkyUU9x?=
 =?utf-8?B?eTRiWUdIQ2swR0FBdThjdmhkN1h6VGdHYnd6bjdjRTF2TW5XdkxPUURXV2JD?=
 =?utf-8?B?aEVWR1VZS0xaYWh1ZHd1d1RGaXVFOVh4OGJ0MjBEZlpnNVRiWW5Nd0IxcGdZ?=
 =?utf-8?B?WVVYQXp0MkQyNUtJdGlLb0JQTVJQd2l4aDdUVzEvSGpIUUZmNUVnWTQrNVZk?=
 =?utf-8?B?RU5XZWdFZVJmUHgxWlJ2dDFud2dhTk0zTmhaWE1kdmpuK1lZWjh6eERFRysz?=
 =?utf-8?B?UWk5b2VhWGFRaFpUQlZNN0tQdDlURUdHNk5lN0JEZENkeFdoaUI3ZGNTd20x?=
 =?utf-8?B?ekZVeEgzZjhUR3FaaDBqTVRSTStkc3Ywb2dvOVNCRXNMZVFIVGxFT3JGd0Rr?=
 =?utf-8?B?OWlxdG94U09FOEI4Qm5YeVF6a3puSlRTZDJPT0ZyK3VBaFZIanM5eTRuS1ZD?=
 =?utf-8?B?eTdhVm14cVhhelV2UW92OExUNk9pRXcwdkNTdmVlOE9CRmdJL0Y3akY4SG9S?=
 =?utf-8?B?MkVaM1BBUXQwSTZiZnROTkZ2dVpmVlkvNUhsNzRHazBNbWRabmU3dlI3Z29z?=
 =?utf-8?B?Qm8zcDR0OFNuSnFUUStwa002dlZMMlkxNzJWTUJJSVdmdkhjNmZvbWw1bVVv?=
 =?utf-8?B?M3cxd0FmT1FXTSsxWEFBaVZSbGJoa21zZ0M0bEIxa2luUjBXelpPKzB2ZEVP?=
 =?utf-8?B?MTRzbHZjN1Y0ZThUVnV2TGpsSDk2QW9ZWjBoS2VIeTFvNnhRZUEvUGJmM0VY?=
 =?utf-8?B?OGtHczA4Q05VV05LRWtNaWZacmZ2bmhrMUdLUmg2aGJQTmZZbWxyeUxTZ3A2?=
 =?utf-8?B?RzZ3Zkx6U2NaNER6MVpUUittYjZKWm9GVDdYeVR2S3lGblhONDNJbE5TSU1T?=
 =?utf-8?Q?UlECOnKK083so84RjSdPaSFhmz8eqtAqeQ+ASSlTD74+?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 60111b7b-dca4-483a-7ff0-08daa86d55d1
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 14:07:57.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YR0JlGJEF3ZCfdPDvnCyg8PbsfbxxRyAGWa1Ls1dDbkOEXS5b4pekmjNohxfxvm/yy+AYLQolJF2LaVIwU15/YJmWnAf5QybGZ/xcCTvIF625N5v8Yc64xrxgz2+Cq0KN8icf1IoH39Mntclh/kUow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P193MB0639
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo Mondi <jacopo@jmondi.org> writes:

> For reference, from the sensor's developer guide:
>
> ON Semiconductor=E2=80=99s AR0521/AR0522 image sensor is
> capable of a maximum resolution of 2592 =C3=97 1944 at 60 fps
> in linear mode and 10 bit outpu

Yeah, I remember that, but somehow I feel the larger array may have been
usable. Could be some compensation or noise metering area, though.

> However, I haven't found any diagram that clearly shows the
> dummy/inactive/valid pixel array portions.

Will have a look, though no ETA. I think there was something somewhere.
OTOH I could be mistaking other sensor. I don't have the hw handy at the
moment.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
