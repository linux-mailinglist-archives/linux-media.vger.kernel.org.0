Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F10665897
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 11:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238319AbjAKKIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 05:08:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238353AbjAKKHr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 05:07:47 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27572292
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 02:04:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nv9h94W7smqNJf3z4HKPHLqfeI4khy4Y3+77vzfm0IeuCAd+EVSENYs01ZKZ9W5PN0e8wUa/QITxZkN7EiVvfpJ/Wc+JKNIcjfGTHrqvbKuUGxSMARXVSXQppe3DRImjOvdRTvcnDulKu6Hg4Q43wi6dqGsKSKKC1/M8ow5H5Qs7aMX316OKWPPmBRldm4Fu14PWycwMmY3bVKURd3fyS2k5H7kv4nw1oDkUHWWEOW3rSR4IrYKDhQjKYfTBij3dH8m0Z3ObrEq3tV8LEmicB+zXetHLDZebt+muhyV+4ZVrpRBlKRFhs689rSdnv4CZCugihWntSHpp/QDSujTqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrUMZbCAs3/61JgFrqvvqex2oYo5vcjdHUkqkuVnxL4=;
 b=AJ2X9PQcHgW9U8oX6ioLKofr5nFtEWe+y1mjFY8ug683uXeZ0ezzlSNv7EiSQWxcghtHW9eH2JJeXGbvnFDF+R4XrjWlZolp+9lYp7widvSkI+LEY5UT/hthz+Z2GlUHBiSmepupwh2f/HddXl2zDBXuHhooIn+6ccDVE1kxCCYLqiW2MuJ6rUViRHPz/VRBj50NWCVrutcL1LBW2VIkIyKeT20ot3SbkV1MLlHnZ3nelWDvy3McBnCRZCTCCGyc1J1S0iPuQQ1brtHcyIolVMB5k6kLCkzZ1YsySHkkAL6kA3a9W7WDFEkUhewxKVqB+thTlmzIprkN/Fm4s7tVCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrUMZbCAs3/61JgFrqvvqex2oYo5vcjdHUkqkuVnxL4=;
 b=aBSxIRnvR6Z68VAs2WewGklqL8ir5b71NxNFEqYpMeShl/ZtcDaoxIuBsKWvM3xD4hIg2KTxohd1eT79pCkprJQa5JdyFbiABzPOiDSozz3ij+tNvvknnvTU2tymP37RVW3QU36xY9kccvM8HN5zJMKOsekOZhr1j601w5/5qIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by PR3PR04MB7420.eurprd04.prod.outlook.com (2603:10a6:102:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 10:04:10 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9%7]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 10:04:10 +0000
From:   Li Jun <jun.li@nxp.com>
To:     sean@mess.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH] media: rc: gpio-ir-recv: add remove function
Date:   Wed, 11 Jan 2023 17:39:21 +0800
Message-Id: <1673429961-26246-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|PR3PR04MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc211d0-6dd9-448a-eaf7-08daf3bb2f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LX5vOnQjKI/Ug6HlYzlBhxYAjzVSizZJExFTF8TMQKduttiXoWC3abs8CIrnqfRZ41+tnF1tKI1XJr/BY0nqSHPruUl3PnGk0LD18lSlBf3vTwvw4BKTy3JCVOa2OJshpvlVhHWeO83PKCNrQR/PeY0p/YaFMCDTZx+/AZIk3eyVY/U7IEGCSWB+TMWoDFozdiiF+1uPsWfkYCd4UyXQ62c/Q6tdbHFKcChQ/VdfCt0CLx/OUJgiNxMuc+iGQpRbLnEfjorLtw3DD1O2Ut/PUCjECe1V/whgUvYjs9zXSyMgDIQVIxp/fabYIcZNbBB49vm7FR+yIkQphqVKi3Kg8F0aodTua8/uLbDc3qwdE+l67FMqnAo509xNiQYq/7v1n5pUjnjw0Ojxrq4hJuJa1BGBcf9cVw/YamhCpTVuBReteLNTgsk7l/IRhmygwnfoa/yHnxPNxskcKB1rz7HmnkfGmd7jQbEAPwR5unoB/edNMGeygDUyTbRWjqseE0Tf1q7Ul2ShXd6TICtPFU0uggN3SnauUn66Q5pKzZbTgogvRajsxsXjN2Ex+juSe6aor/0Y2EBUeCyB2PetRtUGrN+NnzT0X0WRCwng33zSmumotv+t3y1YilObZapOK7x7CMRc0wLj3QyQ6N7j5SUFFnz5jO8whtSs4h3WZ6mO5o++Qo1vbTXdr7iiwGtvsByPPzFlSkaxfZVyBY+boMMYLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199015)(36756003)(26005)(186003)(8936002)(6666004)(6486002)(6512007)(6506007)(2616005)(66946007)(5660300002)(66476007)(66556008)(52116002)(45080400002)(316002)(4326008)(86362001)(38350700002)(38100700002)(478600001)(8676002)(41300700001)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SzRT/772O65rj+Uc3NlxYaYyAzvD4GmEJYENnH/omGJwnTJo8Fb6+36pGXgA?=
 =?us-ascii?Q?KXGBEzsUqWjZA7uxKrZxcw2kHYIjKRP6kb2darIPwcYvTz9PL0slbjpFw8OC?=
 =?us-ascii?Q?NuinY+QzhW+EwuG06rD1Sce1qzgVcUdrUTcJSQsHbAo28jSgGnmt4whTDAY2?=
 =?us-ascii?Q?CoR60HUdSqhqnFgPS8ptYY6vvT4k8IrOfDTWfP19HTEek0UGTy5pH8bp1N6O?=
 =?us-ascii?Q?Mq0/fAmery4uPzXhtTPctyNzThRmHULzgRmX//cdSOPSxX3CQj+lmRbk758C?=
 =?us-ascii?Q?NkrDvyl2g91NmJDNSZOiDd59XEFsr0bzP2/UkU+UMmV7O+AfzEfztKBM1pFv?=
 =?us-ascii?Q?BukAqfNvTjElBY4ON/q/3u8zyxC4PwoVLPsYnX+XcelNs1zGfqA+NSbvlnq+?=
 =?us-ascii?Q?u57Blq279CUhw9ouaaoweIftcKEtQMUAVAS2g4BNLCuXRN6+glRJwNPXC5Iy?=
 =?us-ascii?Q?cHSaPziuDx2RYTA5VQF/NFH5VdOPD/ChnS6DpkgIlz4QHMk7Q9PFVixnTJOi?=
 =?us-ascii?Q?AW0M5/ypVB+oXSJhTwegAaZJ+UhKBQm5jDi28tx2nryVEqAew5UK9GVH05lg?=
 =?us-ascii?Q?N+OthHvEKxAMW5ZyaLUDYJQa3i7THPwzIg6JMjf0r3wfvy1Tdofiz87JvrJE?=
 =?us-ascii?Q?S8i1ljb++Ov64JWv3ZjBFEUsKRHYIH0YMhbtvmWpNDvq/HLVBYfsj3ZM0Zyh?=
 =?us-ascii?Q?YEDK6yvT6eb/+Su6MfBI29ucvXhQ3LTsOX0nYGVppj7zbW9pAzSeSA7dVe4F?=
 =?us-ascii?Q?zBu9pAln7SVEzLupceXiq9D5SzmDwMFJjt8JBbc1HODI+Y0mfVumHrxSQDkW?=
 =?us-ascii?Q?M7pN3K3g53p4qrns6/SbJwuuvOikacXl82YxOmAklsEaR49Sf3tORUOFNXhH?=
 =?us-ascii?Q?ZmLs6FV3++bIA32RyMzzhheOl039OsC4raSOkmoU/hXxSEbP3rY8WJuWf+Py?=
 =?us-ascii?Q?VOcNnmAzgBm3GDS0OtG5Xx7gHSK0jKVZW/61rOZM99fZ0rfi2ORheiTjAACG?=
 =?us-ascii?Q?buyF/f/3GtqJvbnmcwBhVvZNwKuVUYvzlzmUJX1Qs5BhcDB685OS7Ipb0Xlr?=
 =?us-ascii?Q?0T1fkgqmHCbdLiPLdQdIH3pm+HceQkBHIc22BndbIAuPXKwBFnXRA14ibTlk?=
 =?us-ascii?Q?SxrwZHqdA2cS+zfkoUmsEmv9kW2KcM2LBFV8NEvH4T5SF5KtnmkB/DuBAupZ?=
 =?us-ascii?Q?OzlRniJX/cyWMMw8Usd25dzwlSpr2cqjjgJg70XHxmQnnoXfRKfBiVSUfssG?=
 =?us-ascii?Q?uMFRvnyH49+QL2oYjgPdqVb5RDXkQ+ltBeP9NMmqtnlCfyhhIcY5oKUvrrVK?=
 =?us-ascii?Q?ON2jMtr+9xYbdWLZGYmBNRUuZlshjftl0zXJXbmsBJqXHQWRA2RXwDBNB/u3?=
 =?us-ascii?Q?QffGt3rdVbWOF5X+vhBSnDZ54DwgOOnQILqZ7iLcgdQnrdEJcBVbEbSjmA67?=
 =?us-ascii?Q?v8CxzBFwFYBtXsteEqHv/7lb6EoZh6kE0dHwurlMDZrwZXU47xf/LaaVaXRo?=
 =?us-ascii?Q?krjR/ZxK9Zc4lAFQi97T43XuKpB3/dDcFFOQ4OPsPo2pcEaS+jCCUEcfxCvH?=
 =?us-ascii?Q?TNsTdF4JLPVQfP23xt/3EW4+OQNqQJ+q0XHzQXkk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc211d0-6dd9-448a-eaf7-08daf3bb2f0a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 10:04:10.2525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vob/FOX4tV+FlCXotmuHUktuhEpdLwV1M+AH5LgJKyxl2udAaYbFvX+t5tq7+yQv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7420
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case runtime PM is enabled, do runtime PM clean up to remove
cpu latency qos request, otherwise driver removal may have below
kernel dump:

[   19.463299] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000048
[   19.472161] Mem abort info:
[   19.474985]   ESR = 0x0000000096000004
[   19.478754]   EC = 0x25: DABT (current EL), IL = 32 bits
[   19.484081]   SET = 0, FnV = 0
[   19.487149]   EA = 0, S1PTW = 0
[   19.490361]   FSC = 0x04: level 0 translation fault
[   19.495256] Data abort info:
[   19.498149]   ISV = 0, ISS = 0x00000004
[   19.501997]   CM = 0, WnR = 0
[   19.504977] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000049f81000
[   19.511432] [0000000000000048] pgd=0000000000000000,
p4d=0000000000000000
[   19.518245] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[   19.524520] Modules linked in: gpio_ir_recv(+) rc_core [last
unloaded: rc_core]
[   19.531845] CPU: 0 PID: 445 Comm: insmod Not tainted
6.2.0-rc1-00028-g2c397a46d47c #72
[   19.531854] Hardware name: FSL i.MX8MM EVK board (DT)
[   19.531859] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS
BTYPE=--)
[   19.551777] pc : cpu_latency_qos_remove_request+0x20/0x110
[   19.557277] lr : gpio_ir_recv_runtime_suspend+0x18/0x30
[gpio_ir_recv]
[   19.557294] sp : ffff800008ce3740
[   19.557297] x29: ffff800008ce3740 x28: 0000000000000000 x27:
ffff800008ce3d50
[   19.574270] x26: ffffc7e3e9cea100 x25: 00000000000f4240 x24:
ffffc7e3f9ef0e30
[   19.574284] x23: 0000000000000000 x22: ffff0061803820f4 x21:
0000000000000008
[   19.574296] x20: ffffc7e3fa75df30 x19: 0000000000000020 x18:
ffffffffffffffff
[   19.588570] x17: 0000000000000000 x16: ffffc7e3f9efab70 x15:
ffffffffffffffff
[   19.595712] x14: ffff800008ce37b8 x13: ffff800008ce37aa x12:
0000000000000001
[   19.602853] x11: 0000000000000001 x10: ffffcbe3ec0dff87 x9 :
0000000000000008
[   19.609991] x8 : 0101010101010101 x7 : 0000000000000000 x6 :
000000000f0bfe9f
[   19.624261] x5 : 00ffffffffffffff x4 : 0025ab8e00000000 x3 :
ffff006180382010
[   19.631405] x2 : ffffc7e3e9ce8030 x1 : ffffc7e3fc3eb810 x0 :
0000000000000020
[   19.638548] Call trace:
[   19.640995]  cpu_latency_qos_remove_request+0x20/0x110
[   19.646142]  gpio_ir_recv_runtime_suspend+0x18/0x30 [gpio_ir_recv]
[   19.652339]  pm_generic_runtime_suspend+0x2c/0x44
[   19.657055]  __rpm_callback+0x48/0x1dc
[   19.660807]  rpm_callback+0x6c/0x80
[   19.664301]  rpm_suspend+0x10c/0x640
[   19.667880]  rpm_idle+0x250/0x2d0
[   19.671198]  update_autosuspend+0x38/0xe0
[   19.675213]  pm_runtime_set_autosuspend_delay+0x40/0x60
[   19.680442]  gpio_ir_recv_probe+0x1b4/0x21c [gpio_ir_recv]
[   19.685941]  platform_probe+0x68/0xc0
[   19.689610]  really_probe+0xc0/0x3dc
[   19.693189]  __driver_probe_device+0x7c/0x190
[   19.697550]  driver_probe_device+0x3c/0x110
[   19.701739]  __driver_attach+0xf4/0x200
[   19.705578]  bus_for_each_dev+0x70/0xd0
[   19.709417]  driver_attach+0x24/0x30
[   19.712998]  bus_add_driver+0x17c/0x240
[   19.716834]  driver_register+0x78/0x130
[   19.720676]  __platform_driver_register+0x28/0x34
[   19.725386]  gpio_ir_recv_driver_init+0x20/0x1000 [gpio_ir_recv]
[   19.731404]  do_one_initcall+0x44/0x2ac
[   19.735243]  do_init_module+0x48/0x1d0
[   19.739003]  load_module+0x19fc/0x2034
[   19.742759]  __do_sys_finit_module+0xac/0x12c
[   19.747124]  __arm64_sys_finit_module+0x20/0x30
[   19.751664]  invoke_syscall+0x48/0x114
[   19.755420]  el0_svc_common.constprop.0+0xcc/0xec
[   19.760132]  do_el0_svc+0x38/0xb0
[   19.763456]  el0_svc+0x2c/0x84
[   19.766516]  el0t_64_sync_handler+0xf4/0x120
[   19.770789]  el0t_64_sync+0x190/0x194
[   19.774460] Code: 910003fd a90153f3 aa0003f3 91204021 (f9401400)
[   19.780556] ---[ end trace 0000000000000000 ]---

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/media/rc/gpio-ir-recv.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index 8f1fff7af6c9..8dbe780dae4e 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -126,6 +126,23 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 				"gpio-ir-recv-irq", gpio_dev);
 }
 
+static int gpio_ir_recv_remove(struct platform_device *pdev)
+{
+	struct gpio_rc_dev *gpio_dev = platform_get_drvdata(pdev);
+	struct device *pmdev = gpio_dev->pmdev;
+
+	if (pmdev) {
+		pm_runtime_get_sync(pmdev);
+		cpu_latency_qos_remove_request(&gpio_dev->qos);
+
+		pm_runtime_disable(pmdev);
+		pm_runtime_put_noidle(pmdev);
+		pm_runtime_set_suspended(pmdev);
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_PM
 static int gpio_ir_recv_suspend(struct device *dev)
 {
@@ -185,6 +202,7 @@ MODULE_DEVICE_TABLE(of, gpio_ir_recv_of_match);
 
 static struct platform_driver gpio_ir_recv_driver = {
 	.probe  = gpio_ir_recv_probe,
+	.remove = gpio_ir_recv_remove,
 	.driver = {
 		.name   = KBUILD_MODNAME,
 		.of_match_table = of_match_ptr(gpio_ir_recv_of_match),
-- 
2.34.1

