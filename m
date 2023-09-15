Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E43857A14C4
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 06:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbjIOEYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 00:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjIOEYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 00:24:05 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061.outbound.protection.outlook.com [40.107.104.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A364C2709
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 21:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9cp6DpJS/ghA76qJV1ot8Kj13Y5KK10w8YK2t8Vo/f0pAzxmigxLw4AVEBbIaTWm5ds3YM8xDygU3OSXKtY+Q7jtb9FhLM9598L1nmgcyWdzrfAWT4BdWuPMhbO7u+AOQ5P+1BSPwpbc7tNRDa+js1sl4QalfAXavV44XMRBNrdzaJtRVqmmTDWSfDxQsmgDNnEnEM/z/vqEf1mVJ93aROdpr097tQx1URC+n6MLooMGUWwd23k+mApVwQP6hnIEFon6y9/8FI5W7SZfp4sEkKYTnQBem5i9XLD4lidTTc9WZUpjjxYdbBa7f9fH1Nhcmd+GXlQRqnqYGJt1QNRJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4v/+AZsVQ9Sg527rk9X3rv+aOZKngrglR9nJGFmdw9I=;
 b=oDQpQRS43/9wylWLMnekmO6QeSyEQGFLFKj3/pIs+Dh6w15wqFalRZOkQUNWUaYTnOW1EwPmmqxOWwjbF+vHyZbKhvYfJ/0IhgfqU2dHh+KVtlgLqzoCHEAHcFHjRRRAWFq/mCZ2ZP9J7lp8Xb4MJGKpWGKvwo+5Y3DilpmxScOB4KEXJipz5A1MackpmSNBv90Rpp7nlXLYi2E1XzyKDBmvAa9X3BroqCt9AnAe5+BXm6L51XdlDBbwFJbT6PJI2oSwrJZIZNOY/INdLiO7ISsCHton4CULDzO20e2OEYC8WYEb4fhzAceRy3aMJI77i9H7CGPpoU6YkPaeda3r6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v/+AZsVQ9Sg527rk9X3rv+aOZKngrglR9nJGFmdw9I=;
 b=k78r/DnQ6SpZ811YncY1u+eh0OpZ0KX8hoebbnPz0rj8so4MjzmX6lkwTlZRUnYhnki5tBKn/eRz//VuO81wXJMdBttQ/VpvkKZaDN5HHE43yFdP+C19aL1wza2EvcbU+SbJgHvtolV9g6Hg711zlyuOXvJil2fQ3bMDM5lOS0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by AS8P193MB2190.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:44e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 04:23:53 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::579b:2:bf1f:24d]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::579b:2:bf1f:24d%6]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 04:23:53 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 35/57] media: i2c: ar0521: Drop system suspend and
 resume handlers
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
        <20230914181704.4811-36-laurent.pinchart@ideasonboard.com>
Date:   Fri, 15 Sep 2023 06:23:45 +0200
In-Reply-To: <20230914181704.4811-36-laurent.pinchart@ideasonboard.com>
        (Laurent Pinchart's message of "Thu, 14 Sep 2023 21:16:42 +0300")
Message-ID: <m3msxo12um.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::19) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|AS8P193MB2190:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b7b5a26-adee-4ed3-8f6a-08dbb5a3916c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 91FA6bkgGAE/rr3hkIVvv3+iHDr3iSPsBTuiBrpMsK6HocHYzN8lfNOjwmpgdj1tjYVgQQzyj0/LCHwsWhwwKBD8N5kHgfrZlVllwHsVKNCwRYmASxkfxeKfxLQJqBG9/6owbqOu8JoBfh5161HGcfpCOTJ5ICjMV9VrULfDaFitxOooXHbvnphzWW9SvtsiAgXFFM11GjdivLt0UbcAYQvC8SlWeAore+bGy5XTIPO5+bBEkkaYdZpFzmSP/2VARl5NRkB6LPvHgE4K6AIJGOw/xEEslVO5MGA7kgw19QKMcL+tmWMlUF1Gf6LPuakab7V35BZQnKVGeNkWi5LraBxsGgeKIysG72GQfOon1MjOnf9+VoOGZ/v4eVWJ06QO+qjvuoFcQywvsB1twgSifGGdT0y1DBpyIAyzP6k8XQQ2iWF7A3z5OzLSpo47K6iIrVKM4rqWFhr9bTGEzD7osxgDMxLqwCn9Bk6ivYYDaNPz/6b7ycTMY3+1ZVSjiRE19CDa1CjNgX7OXGeHRvTRm5+Ow0o5XTkqGflCCPK2mxqaHjHbIW/9Y5IKxhxgfTjGGve9PTmoeqhbizlnbTMhDQtW5++C/RcEI6nmHyiLPACKL0lqjc/d9UCOEfZTN2Ui
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(346002)(396003)(1800799009)(186009)(451199024)(5660300002)(8936002)(8676002)(41300700001)(66476007)(316002)(786003)(6916009)(4326008)(66556008)(2906002)(66946007)(6512007)(38100700002)(38350700002)(66574015)(42882007)(83380400001)(6666004)(6506007)(6486002)(52116002)(26005)(478600001)(4744005)(15650500001)(83170400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mld5UjJ2ZmRwMjE2QjdqT3JNM005V2VOTVIxdzQwN2QvS1NzSzRZdFVEK0R6?=
 =?utf-8?B?QzVzT3VYMkVhNVhJOW5UV3VrT3lGVklsck5FMDZ3Nkl0aHpRWVFNbXl0bDkz?=
 =?utf-8?B?czFnMGdRbDJGOUoxbkp6R0tia2h4SUxwK3U2Qk82SVdGVHhFS1VYYjZZTWxR?=
 =?utf-8?B?bkg4SHVlMllxSWg3bis4eGliUU0vc202NHdGQmlraFJDTDNsVmd1K3pUWHJQ?=
 =?utf-8?B?Z2RBWW9zRlBvaWVCK0gwV1NxQUg2YkNxWVhrMTA5UzRjUERpRUdGZzhwQUFL?=
 =?utf-8?B?WHYrWmJDbjRhcWxQU3JwWndjTTJ6Wlk2ZC9oODI3Nm1RQlpLeGQ3NTJkeFNh?=
 =?utf-8?B?OTRCLzAxRUxacFFnVmRKRlVrZUtPaldHUitiUHBZTVV5NG9rSElWblJLcW1y?=
 =?utf-8?B?eFZxd3NieUw4TWtST2QrdXBYL2MySi8vK2QwSytsZmNXT1VjYlBCTGd3WGpJ?=
 =?utf-8?B?aUZFalhINzVoMGJlUUx4R1VGQXBMclgxTnBvT2dsczErWHdPclJLWkM3WHVJ?=
 =?utf-8?B?UEVBRHZFK3FHV0MxU1cyYWRYR0hkTEZaRENkMEtqQy85VmhKT3dtaUF6NzVt?=
 =?utf-8?B?VG9ZWTlMTjdvVE9VSW5JS0JtMW1KR0NmTE5OcTFhWDJPTDc4MDJPRlVTeitj?=
 =?utf-8?B?dzNJbklhYVVZaGtrcFdvM2dad2p1dm1RZlV2TVJ5dG1QempycEZrcXRnZ1o0?=
 =?utf-8?B?TTVjQzN5NXJCTzVQRkFsK0N2SkI3YnZCQWp0SFRHNVNtZnJyYTJzeXdKMEx3?=
 =?utf-8?B?d2hWUkF6cjd4QXVZeW9xMmF3S204V2VUUmUxdjBhQjA4cjJxUkt4WDJaTlAy?=
 =?utf-8?B?WFJLcDZiR0lsdStseGNOY1dxVExQZG9PZjFOcEZTSVJQcVg0emZ6VVE0ajVn?=
 =?utf-8?B?YXh1bmRlV3Bybmt0czlIbHRuSDJHVTloRndaZlJTQWo5YjdzMnRuTEwwR1Fp?=
 =?utf-8?B?L0FWR2lmSGUwUW9IeUhiR3IrOHVTOXlPL3dRS1llSUVnV1g4VHJ4cjRnR2lY?=
 =?utf-8?B?OVBtdmJjWW9NdTJQbXpaMXVTWE9UN2pGdjVkaGc2MFRPWlRRUnFoSjdITndY?=
 =?utf-8?B?M2VpaGVSdG9SZ3FRVENpemg4ZUV6MFFwVnZ2SEFOdWxITnZNeUtKd3JYV05z?=
 =?utf-8?B?ZTBEdXQ5QldrUmVJdHBDU1lxcDNIQk83Ni9MWkd3OWtxTzlackFnQjZ6L0gy?=
 =?utf-8?B?ZnJiZWNzWEtvNGdobGxkM3d0enprSzFRNmxBdm13SG1OelRPQURWWWlxNUJN?=
 =?utf-8?B?NW1YUmprbzFSbEdna3dobHAxREFIdHMrMXlBNlZJYlBPYnEyQXdQL3FmNnll?=
 =?utf-8?B?Z1BBOENydVVEVmg2K09aVjI1NmdQZEo5OXpIUSt3dGl6UlkrQ0JlQStuN1I3?=
 =?utf-8?B?bXNoQUFlUnJKWlplaTVMSDBjRkJXMVJMWm1aV2dPR3lFdm9iNkRmS1pPT1BC?=
 =?utf-8?B?QTZxTFc3bVcreml6ZU5wTmNLbUp5OHE5K0FOUkhVa2ZqL3prdzQyTUI5c0NO?=
 =?utf-8?B?QXlTdUJnT2V4akdrUTQ1RkxTRjl2ZTRuNSt4RzE1MjB2WXJNamYzRWY4MGdG?=
 =?utf-8?B?TEZlUnlFZ1NNSVZONGJ0WU9UUU1lRlFYYUZYYWpZSm9ESUpkbEpLb2ljOERa?=
 =?utf-8?B?MDIyazFCcURXMU1GajVabSs1L0NvaVVkVllFU1V5SFRXSkxKRmlFeXcvSlFx?=
 =?utf-8?B?WlI0cWRoNC9wYzRJSlFNenFOanhsamplS1NOUUR2TEVjYzJsNnNxT3lFSm5h?=
 =?utf-8?B?cTBCT3Z0bXNxV1ROMHlqbUNQejh5RkFpOTBLUXRNeFlSVmVUcjRlbENaSzky?=
 =?utf-8?B?QkdJNHkxZWlpbHFieW9hcDV1SGhYUlF5elM2R1Z1ak10eVZ6cGYxVWNYSmcv?=
 =?utf-8?B?OUVYekpTNGZobExTaUxqdkpheCt2UHRicnJZd3RlajMxc3ZFdVBRM1hrSGVk?=
 =?utf-8?B?UllFMzNvZGxyOERJckZ5WlU3a2FnU1RmeWIzOStuSHNRbml3NnJNUmxEKzhv?=
 =?utf-8?B?Mk4vaGdURXJYSzR1TDBqRXlWdVBXZ2J2aDZYTnZ0SjI3V0RQOVpIcWZIVTJH?=
 =?utf-8?B?bEZIN0lZWEZ2eG9nZlpLcERGTWdaTS9RVzBQSU9OT25PdUg1UWc2cEtjaWpk?=
 =?utf-8?B?UnZYdHVpLzBWYVY1QzhKeXNvT2JVdVhXVDJnSlZ5MXA4cmt0ZmN0OGk0ZXFi?=
 =?utf-8?Q?gO9nOjIBvffnU169lPoiDuerFjXCILBu4gcbtCwhykNT?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7b5a26-adee-4ed3-8f6a-08dbb5a3916c
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 04:23:52.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGNGUjhxiGh9UCc4tUsF8dzIk50YEkKKH7Yt8g7cR1AbwEtDpPtV+dmNwTkq8dYrwWVPhsFIUUdS4gUxo/mNQdMBqjubdI0N3t+SaJ/qh+uNBH7GcOG7EQpGwWjAgqDlq56uB0Et+15ySmtLmxFmvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2190
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> Stopping streaming on a camera pipeline at system suspend time, and
> restarting it at system resume time, requires coordinated action between
> the bridge driver and the camera sensor driver. This is handled by the
> bridge driver calling the sensor's .s_stream() handler at system suspend
> and resume time. There is thus no need for the sensor to independently
> implement system sleep PM operations. Drop them.

If that's the case, good.

> The streaming field of the driver's private structure is now unused,
> drop it as well.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

> ---
>  drivers/media/i2c/ar0521.c | 30 +-----------------------------

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
