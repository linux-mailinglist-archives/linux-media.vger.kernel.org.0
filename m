Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 186C954D413
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 23:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350178AbiFOV7z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 17:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349828AbiFOV7n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 17:59:43 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-cy1gcc01bn2073.outbound.protection.outlook.com [52.100.19.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B551454BD7
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 14:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC+mLpZHb7If9TtBykEaMXsQYjCNZr6W7AcSFyc5Mmfl1rWfEevHYteM7j59vZcoaKfLN3Md6frAeA1xxMxzfEL9PRCs5YMVDuTjNWXU7l9JsZTa/aE4XWx6sA7y6CdWO4fJvqW8yftvUcAtYnxVzvaNodcn0MIqC4hlPmD1tbUXnQBSkeiVolpXtAxUCWv7piggCDGSDBvg6yssbjxUcIQi7raZ5rMZNjauwiCEKkuBfkWQ4yjMXdk8BYVUCFDX60FSVm7bH6DzuB4NU31tvaMERZuBQpceUNqXfVdm2HqxmLa78M9DEFQiei4GGq2PD2/ewB826DywtQETBM/3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQsm62DnO3DRMaTO7/AWxijWtNxIrL/VW/Qe6xhipJU=;
 b=bY2xbw0jUVtAEgDsOEYebXI4xnB1C9h1Nhef/vFA8Lwi4eI0i3A1BNBMlRXWE+Ul8GMwcnW5RXqnbl8n4t+QyxLHwYAbhMT1sRGfnRZV5JrNJwFdL6HfRQoDV9ezJUE4pI5ravPDnJfbUJl4xmQQdoRIlLpo2pbRTh7rUMvHnCSbu5kijWuVTMqi+EoHbPmqvQkTyBvGkWfWy3lrwuOEdJzMAo443yse3duiD/mr1xlE21HUoAr+RFgRf6aTAobeV9DYTauaNsAGt+Rm8Gq2DthhP6XqSqUtyLrmd366gvrPbSiQQredeP9VTw2jC7HI8aBEv2l88eN+5lCfYvLfPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
 is 91.151.71.70) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=solairedirect.co.za; dmarc=none action=none
 header.from=solairedirect.co.za; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solairdirect.onmicrosoft.com; s=selector1-solairdirect-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQsm62DnO3DRMaTO7/AWxijWtNxIrL/VW/Qe6xhipJU=;
 b=7aT3DXzcveL+q4iNFkCwIx9pY3S1e58rK1UttBhq3Al18uACGji6g3bKCppzzW9VrJwgfq425SMBwf0GBeIP4nFJ3Pgp6lJ5UMkcLPuFyk3KiU17iz5OpPGsgGo2KokQopVMFjquNrF5+rse//7HM7gVGhroEo+NroKa/YyveYE=
Received: from DB6PR0601CA0007.eurprd06.prod.outlook.com (2603:10a6:4:7b::17)
 by AM5PR0601MB2545.eurprd06.prod.outlook.com (2603:10a6:203:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 21:59:39 +0000
Received: from DB5EUR01FT086.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::42) by DB6PR0601CA0007.outlook.office365.com
 (2603:10a6:4:7b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Wed, 15 Jun 2022 21:59:39 +0000
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is
 91.151.71.70) smtp.mailfrom=solairedirect.co.za; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=solairedirect.co.za;
Received-SPF: PermError (protection.outlook.com: domain of solairedirect.co.za
 used an invalid SPF mechanism)
Received: from SDSV152-VM.solairedirect.lan (91.151.71.70) by
 DB5EUR01FT086.mail.protection.outlook.com (10.152.5.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 21:59:38 +0000
Received: from [206.72.197.122] ([206.72.197.122] unverified) by SDSV152-VM.solairedirect.lan with Microsoft SMTPSVC(8.5.9600.16384);
         Thu, 16 Jun 2022 00:00:12 +0200
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Hi
To:     linux-media@vger.kernel.org
From:   "Emerald Johansson" <marketing@solairedirect.co.za>
Date:   Wed, 15 Jun 2022 17:59:34 -0400
Reply-To: emjo680@gmail.com
Message-ID: <SDSV152-VMtnmjEKhA900047019@SDSV152-VM.solairedirect.lan>
X-OriginalArrivalTime: 15 Jun 2022 22:00:12.0511 (UTC) FILETIME=[497AF6F0:01D88103]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2cb839f-0463-4b8b-9568-08da4f1a57fc
X-MS-TrafficTypeDiagnostic: AM5PR0601MB2545:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0601MB254521EBE16DBF16A6DB28ADEBAD9@AM5PR0601MB2545.eurprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VBwtgtCtF6eUNiYVEYU+D0EFQ4dHYhnohaaW2mXv0OXcwyMR3FtmDmoZQ0?=
 =?iso-8859-1?Q?Da7gVqoCk7b0QCeFeIiSbwsBcZcL1iJVv+A44v4lb/gK7bajMqm2TTrMi9?=
 =?iso-8859-1?Q?Gxu0ewqgP1AvbjHz6B/5ga+LHetj22jTQEn+paEFl+LmpFTDlEqVKYIVjo?=
 =?iso-8859-1?Q?JXU7yzFvUZ5ReAlg+lwBAOWu/s94ujzwIwHphsuGJ9UztBZcyqWqBpW1wJ?=
 =?iso-8859-1?Q?fGRKOzQWACulRtwMbVzqXI1sm/t636Y7MfGLvr9U5bbtIcnf88hKc/cBUB?=
 =?iso-8859-1?Q?cPbXFKBQlYzY9AUhOOXTprMh4ZGDWr/3DHMsxwg9iAnDRiyIVmesificUx?=
 =?iso-8859-1?Q?yd2RUgcFjU+bznWeD3LehuXG/llgvJoSJfBqn3Tx2cbEwwXtX1155TbWGR?=
 =?iso-8859-1?Q?phSkx5CtbGCrhUVYej1Xvd4bnpzxIYjbGFA+WazsaufmuvaTu6b0lwH2Ua?=
 =?iso-8859-1?Q?yqK43y42NevtcoZgj8SWSBcd+9ptwfMW7SnZSWPU7tHgkxQBFgA/zBDk80?=
 =?iso-8859-1?Q?k1GntXgWHJpw2xcKfGMjvhGCObUaRKO9EmZGzwk2HcHzV6MLE50WUSYvLB?=
 =?iso-8859-1?Q?VOEgSMa1Qhu6hA6VRsMZolKlHxG6lfd2cjddw/sOz7rBFIWvC26/e0429H?=
 =?iso-8859-1?Q?Nqo/3JQXjKryij/tXcZwSaVL0lBjAvbWQJtbT8VY1BV6SulUDfEvWsPeud?=
 =?iso-8859-1?Q?AdKGbCkhLdWsgQc0hZBLVMnVhN5Z6ciGZ44ABeIAORdj/It7eg8vkFnW3n?=
 =?iso-8859-1?Q?K864qDSKkW8qUOzHVE1Mg8lfKSMjFTNCXN0JWlTc/bn5ZjvIPaAdUVc4Ip?=
 =?iso-8859-1?Q?SGym3qEZD+goyJERkWxU03+AGNdHxnF8giS6KYOGs+tu6FMNKzfi+WN0lS?=
 =?iso-8859-1?Q?ewwZWrMbjr7XRyxvpbH+neLQNZDctQiAyzom94Nc/yTKgNJscK8KXawdpW?=
 =?iso-8859-1?Q?5AvK8dJLntxKZy1Z7OCkSnWtJ5CG31/0XdrwJFopx/Ia6luv/iQDN83hEV?=
 =?iso-8859-1?Q?5CgTZZLY/BsrlPGXbDiW9gOITYot/ZSsx3eC9MVCu7w9L2rywQ4Xq+AZ59?=
 =?iso-8859-1?Q?pRQx6CxPDjd8Qi3YS+1zws4=3D?=
X-Forefront-Antispam-Report: CIP:91.151.71.70;CTRY:FR;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:SDSV152-VM.solairedirect.lan;PTR:undef-71-70.c-si.fr;CAT:OSPM;SFS:(13230016)(136003)(39860400002)(396003)(346002)(36840700001)(40470700004)(46966006)(3480700007)(6666004)(82310400005)(2906002)(70586007)(8676002)(6916009)(70206006)(36860700001)(316002)(2860700004)(7116003)(40480700001)(81166007)(336012)(47076005)(356005)(40460700003)(186003)(86362001)(956004)(8936002)(41300700001)(508600001)(5660300002)(9686003)(26005)(4744005)(16900700008);DIR:OUT;SFP:1501;
X-OriginatorOrg: solairedirect.co.za
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 21:59:38.9167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cb839f-0463-4b8b-9568-08da4f1a57fc
X-MS-Exchange-CrossTenant-Id: 1c138fa9-0b91-4473-baea-5be5feac0f7e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1c138fa9-0b91-4473-baea-5be5feac0f7e;Ip=[91.151.71.70];Helo=[SDSV152-VM.solairedirect.lan]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT086.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2545
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,FREEMAIL_FORGED_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I hope that you are at your best and doing well. The purpose of this letter=
 is seeking for a pen pal like friendship and I'd love to and be honored to=
 be friends with you if you do not mind.. If the Idea sounds OK with you, j=
ust say yes and we can take it on from there. I look forward to hear hearin=
g from you.. My name is Emerald From Sweden 36 years , this will mean a lot=
 to me to hear back from you.

Warm Regards.

Emerald
