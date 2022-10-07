Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1905F77B9
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 13:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiJGL4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 07:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJGL4T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 07:56:19 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130078.outbound.protection.outlook.com [40.107.13.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FEDCF85E
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 04:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3R5a7UnaXO+7Xe1gakk9jidJS2bEr2JzyUfKw8uX6RE++PVGn32vMkoI4zcJj5bnAdXo+MGXypD+jGNwJUjw++5sMyLRRQCVf0dqMCsRpSJJMcwRjACTp864/lV1g4+OUu9NcZNWV31mY7jGxchnDmxgQ400KlZj7wM2eDxSTcbha2fwoxTWSXOevQ3sbZJJ44aQq25t/8csCB1lvDXVR2LV3RKZkK8qzsT9z7S8ul7JCTzFf4FtgYwLZLVS6UHIiJ8pgapfRwHwHwGOKbvAy0CUF+XybRhlgwDOusTWMAezccm41Vmp+ZZmoHygYGumRecZoofURDX8SqXHrTjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qgztqly+Y05ehRbbVp7hzmVTwNi0MBxA5woVM1TPZwc=;
 b=UU6crIFLtog7bwqmbeFF/5oUqz05s2Ej/6VhfKWkgMxN9SdFr368aXYP/yqfnWB4sdR6JW5NIpfLmXB7lMc/46LIGePoZpqOH6lE6VUOBb7zlnvuZ7caVvN6wOzaegncVVG+SW/ors8d97snt7xq6+DkUNO1E0E0HrOlYVw+S09D1Goxucr0bXC5YWF6qoNKXYlAqcXYtBvFF1+jhDxXv70dAD9R4MGE7u4P+gvMQuAFLzWAeMFoSk8X9FKgH+DZcYXmcj9Cg/c7oVw1pSNRSN5ZFELXICni/I+knK5JSFQqTaGGYRqgzOurbS3JQkG2BziMuSAfTY31hbjiahy9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgztqly+Y05ehRbbVp7hzmVTwNi0MBxA5woVM1TPZwc=;
 b=smpXcRi/PMDmX5pZbrsK0V0t9Brzhj/+zgzr2tQ6HGW5/LnpgDdZhbVdmC9j6DNj8em6LNs1c5kVgOLtBqWCGkXn457sxjzhC6yK8wOMQWuNvBjKLAJlK/zzcZAD+MI2njfTpQ0NcA440VQcqKLEZH60yuRrRXptNyYMwRdVgTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by DU2P193MB2307.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Fri, 7 Oct
 2022 11:56:12 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 11:56:12 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
References: <20221005190613.394277-1-jacopo@jmondi.org>
        <20221005190613.394277-3-jacopo@jmondi.org>
        <m31qrk6wgc.fsf@t19.piap.pl>
        <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
Date:   Fri, 07 Oct 2022 13:56:11 +0200
In-Reply-To: <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain> (Jacopo Mondi's
        message of "Fri, 7 Oct 2022 09:17:25 +0200")
Message-ID: <m3wn9b4zl0.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|DU2P193MB2307:EE_
X-MS-Office365-Filtering-Correlation-Id: de267cba-b2d1-42bd-841c-08daa85aee64
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y1fnX/v2uPGFwg5JrewduvdofvKbf9xJhqsqQEoxe+GZs7qE9ylke8RhqJB0iibtk1hyyqmV9bW+uDe+ZpExJV44HbBf0A4OlE/3qmOvJDIlGIecqzIPWkzB9wLARRuQGNOOs9PbG/Du642PYDNoN065vb1elanimKahMzLojC6zbDI4rjUs96Zl1y1bIU4nv+oCsTX0mLntT8hU9mKj7RgPG+R8Ctb4J57j00f3ApPQC3PnfKEC3BBfSb+YNDo0J+8BtLm23ic9l1sutz9Pkxxysj58ogPsvbBQF5DuMtBTw9N6JX8c6/aHwgVpjYqNZtXhTdVKvl5aeaGX+Yh7R6pJmzuYmrSmSDSCbMf4+62dtGXoJv0pwSHTJ6EaA04nCJVhMyiCg2jzS5WVHU6eA0ZQ4tVGtQHv0fCVlqxgkR7o7FGrjADaUDLNxtLe1Pp1b9DLAAbV2xoogs3Ss5OkQxRe7cVMlvsVf5Kf1LH6VYQFHP1n60fN57Ohyfv7xHafP3WADNeF7FeDH1qncuJq2Nl9Sngun00ksyuAZw7qNpaMY5LxMUAnl8s1NVopHU7UkdmWQq1dWSslQQvdGjd85cCYnNwhU5f0RXu6H9nG+CrvvlH9+6slkC++nVQZtP4ZKstqTAj/wEiwIwkfzpUo3xhCLDcLi4MVVOsCm6dj02vNHjWaJOPvshXhgj6dlIB8k6IVOJ9sW+CN1ML4J8B7iwHy2JJlDueS4jmpPnkYDVKTFWlpixpAbicJ7SUnkK3dRvdxQc94szSanYID5n501Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(83380400001)(4744005)(478600001)(6512007)(38100700002)(38350700002)(83170400001)(41300700001)(66556008)(8676002)(66476007)(186003)(26005)(42882007)(52116002)(2906002)(6506007)(6486002)(8936002)(5660300002)(66946007)(316002)(4326008)(54906003)(6916009)(786003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVMxRk1CSHZrc0h2UHFzT0tsQVhVQVUvUk1scWN1YldyYWVWaU9jY1VrQUw5?=
 =?utf-8?B?cW1CWi9OMWRWaDA2ZVcvenVFSkEzWXg4Qm5NaHV3cExqbmErM3kyaVR4QjJF?=
 =?utf-8?B?ZXdSL1ovbUJRdytyOGV6dXRSOFppT2Z5L1c4b3cxS0wyUm45MlRZeTBtS3F6?=
 =?utf-8?B?MVZoZHNKZUdwdFYwb2FaUk1DcmlmN1RsODlmYllMTzZURTkrNDhkOU9GRlFN?=
 =?utf-8?B?OGFrZVlFRGJENU45N0pDeElFZzEyMVM4THVodzdwQkIxeGw5STRneEtQdVF1?=
 =?utf-8?B?KzdEZ2V5TzlHMVJxcDN2RStWQkZ1ZjFTYjhqSExBcnZZYi9pRVJhNHFqQUtq?=
 =?utf-8?B?NmhyK1FqTlZUTWR0V3Zucm9KMm54d2NsSEJpcUNXem1Zelk1T2x6eUNvaGlG?=
 =?utf-8?B?cS9FVzdwTzBrQVRKZisrZVVPNHlVRTJBM2R0dXl6amxRdDdXUFN4c1dxdytp?=
 =?utf-8?B?WEtTallIMi9lckpOMXNBRHRBeU5OclZmZStMUjk2Y1JQam9hakx6TDBpaC9x?=
 =?utf-8?B?ZXpkMEhMOTg1Zk83UTMvNHhCenpOeENMY0lvMlZYT2J4NVJQazBZR1JwUjR6?=
 =?utf-8?B?V09mdG5RSnV6b2oyUG9WYWV6bkIyWlU0aThhKzRYOXhWUmxRTFdmem9FUVhQ?=
 =?utf-8?B?bUlFM09YUktCb2Ezbmd6QnoxTjNEZ3RGRUNiS3hiWWExRm5MbTVicEZxR0VJ?=
 =?utf-8?B?aEwwTGo2Tm5RVXZVK0pwbEZCZlJQWUk1UWlzSXBwME5qeHNkcm1CbldQaWp5?=
 =?utf-8?B?SVI2MGNRSCtIRXdBTmJlakJoc0l1OUtnSGtESlBvUDdQdW1tbFdyT0hwSFAr?=
 =?utf-8?B?M2RlNmdKTTRJb0g4YkZZZ0hYeWpiSW94UXFCSlc4enhOREZPcWxLSlJ5di9a?=
 =?utf-8?B?TEdTSTk3dFp4bzR0YlhKTzl1dDIvLzhOcmRXa0NSRGpYemN0cjQxbjZFdXIv?=
 =?utf-8?B?N09EN3ZlOWtERHpMdVF6TWhaRU5nTm04cncwTHBwK1RHWnpFQ25kQTBPd3lo?=
 =?utf-8?B?Mm9ZOWh6cEFkbStMa2FVRE9wTDRPR2hhM0F6c1VVNUl1NkYyVmJ3RWRDZzhi?=
 =?utf-8?B?dkxlZ0RGT0Z2LzY0U21YRzI1dWcyNW9DYStnVzVEU0ROWmpORURDNEE4YjAz?=
 =?utf-8?B?eEJJRU5SenJxbHZ4ZzFHcUgvM0RQZlVvdldOektxcnlMWFhmRHNXZ212U3ox?=
 =?utf-8?B?cnlZTHVmODdmV3B4Z1NjUm9RWWIxTk5rc3VHM2ludXZxVTNud0NKR0Q4NGt3?=
 =?utf-8?B?aGxzZlNXQ21rMVdiSW53OGhaNjJyNHBRM3dxanMwMk5aSkpnY20xMURxSUZM?=
 =?utf-8?B?MG5xSVFnbU1jVjRzaU5xYVd6TkdjUDBPZmtRWGhSRm5VQVZYUDFsRE9TN2VM?=
 =?utf-8?B?REZDbnJwWWp2cVhmWmxOODNFNEtYNERNMFBIbitKb2ptSmRvYXlQMUdkSzlN?=
 =?utf-8?B?WlBUYzZUQy8yTnV0YU54dTJTcGM1RVd1Ly9HRGwvQitvWFMzWWFBOFVqeG5I?=
 =?utf-8?B?SEFhbjhrM3I0bjgrNDJYL0dmYzUwcFozWC9sMTN3RjdvOFlMWFRPV2IzcWd4?=
 =?utf-8?B?eCtNSzdCZDBOSEZqZEVjU3NoemFtODVKQjg4bVhXM00wSno3OTEvUSswMWNO?=
 =?utf-8?B?cytKZHVrcm1ZcGNVNXlxNE1YR0ZUZk9sNktIc3JkQjVzUURVSmpKc01lOTBm?=
 =?utf-8?B?cVZkK1lKRGw3R05samxkM1ZFSmhjbWhuV29sbmFwaFhZNlQvaEtuMjhRSlRV?=
 =?utf-8?B?V21ZQnBIZDBZMUl6R2FTamRzZjNGVkV0eVYxSElxVzlibWNBTk5vNHZFNk9O?=
 =?utf-8?B?NGtsM0lwdWt0MEorS3hBNDBYNmVEazQ4bEtveEpNbmRwSGRDeHBVdFZUV0ZO?=
 =?utf-8?B?UFZKSzQ0bHkxUTZhU0tubG9CWGVpaFAzbTJPWW5kaThSVkRDS0pyL3NNbWcr?=
 =?utf-8?B?OEZwR3FnYXBUTFNSajU5Z0xhSEdVZDdlNEJ1Y0JFZks0T29yOU9PUEh4ODJH?=
 =?utf-8?B?SlZzdTN5WEtLM1RZaVA5akhyd0lsaW1XMzVyWWtnTkN3T21JOG5XYWhIRjBi?=
 =?utf-8?B?WUkwVm9iZWtYdzJFSktKbm1VdmxIeDU5SWI4ejV6bEVldUdleGgwMmNPc01Y?=
 =?utf-8?B?cm56SWU1NElYR2VEVUVQVkpTeUpWLzJzSkZLV3pxbWhscy95VEg2NWxscW9G?=
 =?utf-8?Q?NxIvVw9CLo0q7O1woaT6zSsa2rselrEKFmreXHz88ala?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: de267cba-b2d1-42bd-841c-08daa85aee64
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 11:56:12.7840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYeRroeO8LW+B0Dt1ZCoH74x60SAmNyepLvvPclPNpj2N2IvEFtsytS6fJOVHYEFtteWNl7FtPLmCycVI3APxG+87fpUN9ZWbLcp7sheH5wQB0+tqEwQqH0n4c81tpUe9T39P+LCKXgOvyyIcpZBpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P193MB2307
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

>> BTW ISP can't really do that color balancing for you, since the sensor
>> operates at its native bit resolution and ISP is limited to the output
>> format, which is currently only 8-bit.
>
> I'm not sure what do you mean here either :)

Well, the sensor does DSP on 12 bits internally, or something alike.
Then it outputs (currently) 8 bits of data, the rest being lost. If you
do color balancing etc. on this, you may get worse results (like color
banding).
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
