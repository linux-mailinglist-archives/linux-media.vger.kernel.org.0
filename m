Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E058A557321
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 08:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiFWGaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 02:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiFWGaT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 02:30:19 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093603A199
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 23:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrceFndY3hI8FcIWYJsR/TtwIqD/Hj0/723S3+nUfDMRY72REpGscTpkjZGHPguHtNTQefqi/fgIp7oimDS383OgcdcETOSSNtfBvVmTACj5nI69LOQIFODg+V+qiE1X8ufG9WEbVIs/r6wrGgm2RXBnuqEujO3em9gdCsTMjoRDMCIwqPkdmNR8QbywNFcB8A13e22sdyvH8NkfTVsa8Ea5lc3IYwCrCBuExIn2he58jK8zV3PLHahjjGcjL49b8eeI2ZcbMy5E0MvaP3E8GPs5Tg21fXET1vUydLgfkwhvy4HNPOSCkzRjO1LHRNBEhklQ8v883Fth6V7cZ0/wwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaEj9gRjHV/b/Z5DEoXQkNaU/U7KZVi2MtsNOnQw7Zc=;
 b=aQTbx12sApNZirJmtv8NUCUjBbetcTfKZvfgQmyl0i7DBX0ALZOwyzKcn4CmIcowrU01645QZpsFNCYgXjUgkD/OCtwvq/3Lw1OLJQq+ByeVLyvyyRx557HOuLiCz7TZU06jO7Hl/WTrNfaxxw3r0Htl3FaIsgBjpJyFuHSxUNC7AVjmsVZd2wu2JUpDja7O4NW1DCc8jNa+kF+KQh6rOE0S6OfyVkcPd3M7oU9BrmRj3qhb0pH/0A1MGWzGs/pJRnjOHfnlQ7VkrKUD7PFoyaUZRfoUr5MAxFrGb/t/nYDk3oVpoEraI8BwN0VqqF1v1fcvSX64UCnvYZcRm8e7Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaEj9gRjHV/b/Z5DEoXQkNaU/U7KZVi2MtsNOnQw7Zc=;
 b=ZIUzJDKHOO9h4b922sxg/RWhw27Cw3jQqBSQCw2B1ecxxOhREM8DRK5AR45gng5omZAAQkQI8wLGYBt+O2C9VgECajPBDJhfrfJnQ5iKC6EuAmRyHhpZB9kNdAincz1kbWm/dmowj+NazuFEp5Fj7d8LzzOGEIZYyIy6DGbGcLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB8286.eurprd04.prod.outlook.com (2603:10a6:102:1cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 06:30:15 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 06:30:15 +0000
Message-ID: <708506e7-e7e8-6978-ba4d-aa661c6fbb12@oss.nxp.com>
Date:   Thu, 23 Jun 2022 08:30:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Add support for v4l2_ctrl_modify_dimensions()
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <771eb487-7973-fbe2-8161-87491b513ce1@xs4all.nl>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <771eb487-7973-fbe2-8161-87491b513ce1@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::10) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bab7fb0c-ca02-4282-fcdd-08da54e1d558
X-MS-TrafficTypeDiagnostic: PAXPR04MB8286:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <PAXPR04MB828687D8298114C65ADB3C4BBAB59@PAXPR04MB8286.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTl9DtY2Nme9jMazsnB4hjJmaFkCUOViAxxT8Hdv9CCNH5rL60ml90tZbFWymfT5Glsapc6f8NKrSQeeuyHIrs1vVMl8QLVD2RSMWDVdbBfGdJIBFz00lMoIbGIO7Cmz7w7kBtWXncxhjktOOABiGNchGcMvCAX5ou8V8XFaGIhJOoWNeyqnOLJbLN0RaBy5JO3ddhSNXURvc15s6sq/++e4bh9rNEy9sy9A8UMVTuAKO/VCjgF4Z0z/mE+beu9W/AdaGmIA6hJacO6AOqm/n7QUI6e1cp6Gu1Qvi0HbP4nIEBccBMvnuRgeAao/Cuub3t66GDMT7NU6FUzn1o0sIY4n2ptxfHtMSdLHWj3wirf7ORclNxZo/MYP6rI+WlDAUcpgvnzfBBbKtZeHjrBExKKYCzWesAABbawjZZI7eRqHEEc+VH3EQnR90hXJU7W9cZBnlYIGHbW0S34zibqaJPGDf2VZphKOcd9aSxzBryLWJHKibYjfFClb5mLTwHv8SV7lpem7LONZKaM/LwzSw9JjEcGIcpiUWBOwSlG5Rx3mN/Pm79KWfm8ylpdjGoExcFbzgVw9muV7YWZR0nVY5cE8hM52dohZJPJK+5t2mGyT8hAStAFLu4SkTn4qus5Eaf7mmDlsNEUzB4jtI9SE5MSlJxQ+0MkccTXizNB7SghiQIDOQEJEcWjbN6l54Gh38TXV6VHxF5Oh3T7lkJV0nw4YC+WCOzy3GBRAhrzxCeAtPDfQgbhNePGAcsht622r7TKCe6P0ndgRryFeTAyU7R0pxheC5Wgmu4vv4DGITlrb5lLQQAFXkq5uAMLnTbPB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(6916009)(6666004)(54906003)(316002)(41300700001)(86362001)(53546011)(52116002)(6512007)(8936002)(38100700002)(186003)(31686004)(6486002)(31696002)(66946007)(5660300002)(478600001)(2616005)(83380400001)(4744005)(6506007)(4326008)(2906002)(8676002)(66476007)(966005)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y25MbWFOVkJhT0drWGI3RXlPL213ZEQvVkUxNzV1cnlTZHNsSEo0UDdyQ2V4?=
 =?utf-8?B?dGVTZHQvaEdpY3c0ODV3cUFEd1g5R05meVBjOXk3aEdjM0dDSFdzTnhUbzA0?=
 =?utf-8?B?ZHFBbzNxalpTOFE4L0w4YlI5a2ZNMVRtN0xobXRhOVdOcGtKbjdvNnNReHUv?=
 =?utf-8?B?SmRHOXZaV3Q2Qm94Z0FPZVVJTHNDak9hOTZIY3ZBc0FHN2w5MUZYaWpTUTVR?=
 =?utf-8?B?WGhRdVJua3BCNVVoY0lRaUZrZHhuZFV1Q2Z1NWJqNTZkdUNhZTYzY1lKbzhS?=
 =?utf-8?B?YnFoT1g5dWU4SU5aT05uM21BcDAvV2lTL3RGZDg1QlAvNzA0bG5GeUtRYTRl?=
 =?utf-8?B?TTBLMFB5azdzc3UxZnBXbEI4Q3NRcG9FcDBraGk1aVRPVTd3blRJNW1DQnh2?=
 =?utf-8?B?bWk2VDNxM2xpWVpiRG1aTkpZd0poZkJKYkNndFRnclZRRWRNR2tucytwUjIy?=
 =?utf-8?B?OWZDRzk1d1dzOUVSZDRZM2U4U3BydERMQllnSHFnS0Jhbk1ZajFsQVI5MXR6?=
 =?utf-8?B?ZFNzSXVrbGpDZVdvS3h5UFpSRzluYkdTQWcvUjJRYlU1WEhvZnYzS2JJdWZB?=
 =?utf-8?B?bEIvNHdaQjI4ZWdlcVRCS3UwSEIxSnJBQitKckxpRWpPekRET053T01zWnpJ?=
 =?utf-8?B?c2hDYVhsajlQN0hlN1MxUEFJRXoxckRMYzJNcll4Z2VZUnpaOWlRUnk2RXlI?=
 =?utf-8?B?SVNXdGhuWkoxQXFoR2g2YlUyeUtBLzB6N3lKMG5lR3NpODFLaTV2U3BkRzMy?=
 =?utf-8?B?RUNGL2EwKzVSdEdiV0srTS9uT2xDNFM5OEYwTjkrM1ZIZEk5TTRJRTM5NG15?=
 =?utf-8?B?OHV2aWZNaEthUjhsVlg2VjBVOGNpU0lJb3dyUk9oc09JdWhqR1F1dUlCM1ZM?=
 =?utf-8?B?Q2hMamhIeDN5RVViSElaZEpRMTF2Qk0zSTU2RXFxbUUyeGNWbllxOWdZRWdq?=
 =?utf-8?B?ekxESzBWMUdYS0JNNHRWa0dqa3pGZXFtOVJERTQxcVgxYmRiOHk2VkZFMGtX?=
 =?utf-8?B?MFQzUGd4N2pLZGVGYUFJVGd1ZFRZa01ZOEIzdWRCYTR1ckQvUEF5WThoT0Rv?=
 =?utf-8?B?MGR4RW5mUFdWaU9seVZ1MHFIVWpnYzFKMGpJdnlITDBlTnB4ZHBVSERoQ3cx?=
 =?utf-8?B?a2lUV0RSdnFiY0VweEFtVG1veUhpWXBXbGJUbkRqQThvR2VmYldpSDltWTRW?=
 =?utf-8?B?RDNhWmFBeXpRM3JQNDV2VXNWb2M1ZUFTY3RmTnQzM3NSS3VIeFRoRlJtTjRF?=
 =?utf-8?B?cXF5d0xkSGlSSXJ1cTVwb2ZLWC8wR0drUHZwYVprWlFWZktNOFhXZlloQnZl?=
 =?utf-8?B?YXdLRm1XaWNxYmp5NUxHTW5neVh3OTJmWE5PV1NXQVhvSjZLOElMU1JZWlJh?=
 =?utf-8?B?MnE2STk5QVF5a3luNkJRUk1KQ0ZRRDZRdkZKeXVVRXlLQUJubmhIbzhnY0Va?=
 =?utf-8?B?RmdxNytxU1RwVSsydFJTaVI5a1ZPdmZMSng4VzVrSkt6SkJ3eUFUL0h6cEFS?=
 =?utf-8?B?S1JDeWdha1RaeEZwVUpVQStYcU9yYzRnZEZKODRBMmR2cWxVZjdSTGJiSCtD?=
 =?utf-8?B?bnVXUnFpcVhscVBEQ3cybWlLVFNGVlhSb05odHBHZ3ZsejhQZFRKRkNQcnlY?=
 =?utf-8?B?TDJZY0VxdzhyN1YyU0QvRTZISUwvV1dmTE9oTE5Cd25RelBPWmtobmZCc1Fu?=
 =?utf-8?B?SSs2bmNaQXpaSENwZWE3S2c1UTBJbXNKM0sxeFgvY1U4ZGgreXg5akF3dlR2?=
 =?utf-8?B?bVl5YWMvNlRXeVlma0E2TW9YZ1pTSGp3Mld3UFNFOVhxNzdKSFVxTTZDRm4r?=
 =?utf-8?B?NE1VZ3pLcGFmR1VicVNNU3lJMWVsZVd0MDQ2bDBsM2F5UkExSFlad25nWUh5?=
 =?utf-8?B?N2NFY3k0bUN2Ky9XNzZPb0pCc05KOUdHdS9pcGkxZkN1TFFoT0hpOG54eGY2?=
 =?utf-8?B?aVpQYXJRbnh4V28vQmYzSDEyZ2E1eWc5NjVKMXg5ZVFuM28ya2hLN3FoV0hS?=
 =?utf-8?B?YUtJa2Y3VTdmclRMM2k0RkMrZXZNM1g2bExVTUNLM0l6UWMrVDFwaXAwK0p5?=
 =?utf-8?B?VUh4L20rZGs2MFhUdkIxT1BzVzRhQTI0R1hOVlRKeEM2RGV0a1JpSEE3RE15?=
 =?utf-8?B?Z0wvZlRSenF4bkRXRWQ4c1Bhdm5kL1FVSFVIN3ppaE5JZ0RzUlUyUk5PZGtk?=
 =?utf-8?B?K0RFaTkrdEVIZkd4dDlHTEJHdE4rRUZ2Qkhnd00zYWhBeGgxamdGaXI0Mzl0?=
 =?utf-8?B?R1J5TDZvOFROT3p4eS9DTXBkSmZIdnE0b2h1Q3VhalhzQ2tiZU9xMVBGVEN2?=
 =?utf-8?B?U1RBUE02SnEwRUNvSDl3eGJ6Tml2T2xxWnhyczZHNWttTU9tQ29XbG5jcGdP?=
 =?utf-8?Q?cCBqzUNIrx1TQ9nsNEuD905VxYmv3wzM42JTVSEhebO1T?=
X-MS-Exchange-AntiSpam-MessageData-1: 4Li2/NGsIZ7P+pY6Hc5U+FkXvgukOeUhiZE=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab7fb0c-ca02-4282-fcdd-08da54e1d558
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 06:30:15.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmVVdfr/M7JGp2G9Vus2Dth1jLAh8/k1ex/YgKRzJzORqr5ItZWktsGVToRvPar1653SpyIDp2qTmjUvigHlhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8286
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 6/21/22 14:17, Hans Verkuil wrote:
> Hi Xavier,
> 
> I added support for v4l2_ctrl_modify_dimensions() to this branch:
> 
> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=array_mod
> 
> It sits on top of the dynamic array control patches, which you already
> have.
Thanks for delivering this patch set so quickly.
> 
> It's alpha quality and esp. request support hasn't been tested.
I haven't noticed any issues, this works like a charm.
I haven't tested request API as the dw100 driver does not really need 
its support.
> 
> Let me know if this does what it needs to do, and then I'll clean
> everything up and add more testing to v4l2-compliance.
This fulfills well my need. Can I send an updated patch set with this 
wip API such as we could progress on the dw100 review while you are 
cleaning and finalizing this new control ?
> 
> Regards,
> 
> 	Hans
Regards,
  Xavier
