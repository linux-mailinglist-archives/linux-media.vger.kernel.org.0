Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7DF5AA81E
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 08:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235351AbiIBGi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 02:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbiIBGi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 02:38:56 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5397FB69E4
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 23:38:51 -0700 (PDT)
X-UUID: 82fbe488d8c94c5a8454e6032b3e46ad-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=4UYaZQaKSvCLWbTE9GXOE3EFR96jqB4zmTTUQs6yR20=;
        b=VekcNvQdjT7X2HUb+eWBhwrcQvgi+izpxErIVRV9OKAAJMAFK8hem0XKkPOfjXCsVi4Gqu3dJnHp7g7emUX95L+Sf4lufJaeEc08TN4moA4s7uVqvrSnwTo9ZHWfoztOjaRXh+v+jzzMmOM/uK+NLJOya9T0G7QVMubdYS6AQOg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:71f7ed58-5ac6-42d5-abc9-5368c910807b,OB:0,L
        OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Releas
        e_Ham,ACTION:release,TS:40
X-CID-INFO: VERSION:1.1.10,REQID:71f7ed58-5ac6-42d5-abc9-5368c910807b,OB:0,LOB
        :0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_
        Ham,ACTION:release,TS:40
X-CID-META: VersionHash:84eae18,CLOUDID:e11feb20-1c20-48a5-82a0-25f9c331906d,C
        OID:57ff2e3968ab,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 82fbe488d8c94c5a8454e6032b3e46ad-20220902
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 34730137; Fri, 02 Sep 2022 14:38:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 14:38:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Sep 2022 14:38:46 +0800
Message-ID: <e2697bbc0ab3832909e6d1da1f52d1f4d1d3a206.camel@mediatek.com>
Subject: Re: [bug report] media: platform: mtk-mdp3: add MediaTek MDP3 driver
From:   moudy ho <moudy.ho@mediatek.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date:   Fri, 2 Sep 2022 14:38:46 +0800
In-Reply-To: <YxB8b8lkU62yJzDM@kili>
References: <YxB8b8lkU62yJzDM@kili>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY,URIBL_CSS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thanks for your time and all advices on mdp3 driver!

Regarding note 2 you listed, I tried using a queue event to notify that
the suspend process will not execute until the CMQ send task done.
ref: function "mdp_suspend" in mtk-mdp3-core.cmdq

Although I've added a patch (as below)to fix the smatch bugs and
warnings you mentioned, , and it is less complete than your fix
Message ID = 20220831102853.6843-1-moudy.ho@mediatek.com/

I'd like to confirm whether I should send the v3 patch as per your
suggestion or just drop it and let you deal with it.

Regards,
Moudy

On Thu, 2022-09-01 at 12:33 +0300, Dan Carpenter wrote:
> Hello Moudy Ho,
> 
> The patch 61890ccaefaf: "media: platform: mtk-mdp3: add MediaTek MDP3
> driver" from Aug 23, 2022, leads to the following Smatch static
> checker warning:
> 
> 	drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:292
> mdp_probe()
> 	error: we previously assumed 'mdp' could be null (see line 188)
> 
> My blog entry gives a good overview of how to write Free the Last
> Thing
> Style error handling.  Let's take a look at it as it applies to
> mdp_probe().
> 
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>     180 static int mdp_probe(struct platform_device *pdev)
>     181 {
>     182         struct device *dev = &pdev->dev;
>     183         struct mdp_dev *mdp;
>     184         struct platform_device *mm_pdev;
>     185         int ret, i;
>     186 
>     187         mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
>     188         if (!mdp) {
>     189                 ret = -ENOMEM;
>     190                 goto err_return;
> 
> There is no Last Thing to free.  This should be "return -ENOMEM;".
> This goto will crash.  The Last thing is now "mdp".
> 
>     191         }
>     192 
>     193         mdp->pdev = pdev;
>     194         mdp->mdp_data = of_device_get_match_data(&pdev->dev);
>     195 
>     196         mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_MMSYS);
>     197         if (!mm_pdev) {
>     198                 ret = -ENODEV;
>     199                 goto err_return;
> 
> This should be "goto err_free_mdp;".  This goto will trigger a series
> of WARN_ON() stack traces.  The Last Thing is now mdp->mdp_mmsys.
> 
>     200         }
>     201         mdp->mdp_mmsys = &mm_pdev->dev;
>     202 
>     203         mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_MUTEX);
>     204         if (WARN_ON(!mm_pdev)) {
>     205                 ret = -ENODEV;
>     206                 goto err_return;
> 
> This goto should call put on mdp->mdp_mmsys dev_something.  It
> instead
> leaks that.  But it does call mtk_mutex_put() and each call will
> leads
> to a series of stack traces.  The Last Thing is now mm_pdev.  That
> doesn't seem to be stored anywhere so it's going to be complicated to
> free it...  :/
> 
>     207         }
>     208         for (i = 0; i < MDP_PIPE_MAX; i++) {
>     209                 mdp->mdp_mutex[i] = mtk_mutex_get(&mm_pdev-
> >dev);
>     210                 if (!mdp->mdp_mutex[i]) {
>     211                         ret = -ENODEV;
>     212                         goto err_return;
> 
> If this fails it should unwind the successful allocations:
> 
> 	while (--i >= 0) {
> 
> But instead it does unwinds everything.  Stack traces.
> 
>     213                 }
>     214         }
>     215 
>     216         ret = mdp_comp_config(mdp);
>     217         if (ret) {
>     218                 dev_err(dev, "Failed to config mdp
> components\n");
>     219                 goto err_return;
> 
> Alright.  Good.  This will leak the "mm_pdev" references but it will
> not
> print any stack traces.  The mdp_comp_config() function uses One
> Magic
> Free Function style error handling so it is buggy.  The Last thing is
> now comp_config.
> 
>     220         }
>     221 
>     222         mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME,
> WQ_FREEZABLE, 0);
>     223         if (!mdp->job_wq) {
>     224                 dev_err(dev, "Unable to create job
> workqueue\n");
>     225                 ret = -ENOMEM;
>     226                 goto err_deinit_comp;
> 
> Hooray!  This label has a good name and frees the Last Thing.  The
> new
> last thing is the ->job_wq.
> 
>     227         }
>     228 
>     229         mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-
> clock", WQ_FREEZABLE,
>     230                                         0);
>     231         if (!mdp->clock_wq) {
>     232                 dev_err(dev, "Unable to create clock
> workqueue\n");
>     233                 ret = -ENOMEM;
>     234                 goto err_destroy_job_wq;
> 
> Hooray!
> 
>     235         }
>     236 
>     237         mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_SCP);
>     238         if (WARN_ON(!mm_pdev)) {
>     239                 dev_err(&pdev->dev, "Could not get scp
> device\n");
>     240                 ret = -ENODEV;
>     241                 goto err_destroy_clock_wq;
> 
> Hooray!
> 
>     242         }
>     243         mdp->scp = platform_get_drvdata(mm_pdev);
>     244         mdp->rproc_handle = scp_get_rproc(mdp->scp);
>     245         dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp-
> >rproc_handle);
>     246 
>     247         mutex_init(&mdp->vpu_lock);
>     248         mutex_init(&mdp->m2m_lock);
>     249 
>     250         mdp->cmdq_clt = cmdq_mbox_create(dev, 0);
>     251         if (IS_ERR(mdp->cmdq_clt)) {
>     252                 ret = PTR_ERR(mdp->cmdq_clt);
>     253                 goto err_put_scp;
> 
> Ugh...  The mm_pdev name changed to scp.  It took a while to figure
> that
> out.  This unwinds the __get_pdev_by_id().  Fair enough.  The Last
> thing
> is now cmdq_clt.
> 
>     254         }
>     255 
>     256         init_waitqueue_head(&mdp->callback_wq);
>     257         ida_init(&mdp->mdp_ida);
>     258         platform_set_drvdata(pdev, mdp);
>     259 
>     260         vb2_dma_contig_set_max_seg_size(&pdev->dev,
> DMA_BIT_MASK(32));
>     261 
>     262         ret = v4l2_device_register(dev, &mdp->v4l2_dev);
>     263         if (ret) {
>     264                 dev_err(dev, "Failed to register v4l2
> device\n");
>     265                 ret = -EINVAL;
>     266                 goto err_mbox_destroy;
> 
> The cmdq_clt is an mbox.  Fair enough.  Good name, label does what we
> expected.
> 
>     267         }
>     268 
>     269         ret = mdp_m2m_device_register(mdp);
>     270         if (ret) {
>     271                 v4l2_err(&mdp->v4l2_dev, "Failed to register
> m2m device\n");
>     272                 goto err_unregister_device;
> 
> Good.
> 
>     273         }
>     274 
>     275         dev_dbg(dev, "mdp-%d registered successfully\n",
> pdev->id);
>     276         return 0;
> 
> Summary:
> BUG1: NULL dereference
> BUG2: Stack traces calling mtk_mutex_put().
> BUG3&4: Two __get_pdev_by_id() which need a matching put (reference
> leaks).
> 
>     277 
>     278 err_unregister_device:
>     279         v4l2_device_unregister(&mdp->v4l2_dev);
>     280 err_mbox_destroy:
>     281         cmdq_mbox_destroy(mdp->cmdq_clt);
>     282 err_put_scp:
>     283         scp_put(mdp->scp);
>     284 err_destroy_clock_wq:
>     285         destroy_workqueue(mdp->clock_wq);
>     286 err_destroy_job_wq:
>     287         destroy_workqueue(mdp->job_wq);
>     288 err_deinit_comp:
>     289         mdp_comp_destroy(mdp);
>     290 err_return:
>     291         for (i = 0; i < MDP_PIPE_MAX; i++)
> --> 292                 mtk_mutex_put(mdp->mdp_mutex[i]);
>     293         kfree(mdp);
>     294         dev_dbg(dev, "Errno %d\n", ret);
>     295         return ret;
>     296 }
> 
> regards,
> dan carpenter

