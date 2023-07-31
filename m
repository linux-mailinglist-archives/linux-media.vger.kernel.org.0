Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09E5D7698F7
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 16:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbjGaOHP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 10:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbjGaOGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 10:06:53 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807711BF3
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 07:04:19 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fe2048c910so9646825e9.1
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690812258; x=1691417058;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47Lx3g4qMMh4KzHi+DLVelaLZ/RwPmy1DZKuMy7J89Y=;
        b=CpKltfD5GTd0DULWaclmjf4bKKnHihCTry8IxDDgO8ANi0aCCtnZ9AylMzUHnrcVkw
         ySA43Fmkb+XNsBC4O/UJS1YIswxo+hM6Rc8LpD/lBNZuVZcEcvy5UhD0R9xxmCKTVCxa
         zdm3FbF3UlOir2wxnl06djafDk0ep9e2uduIL9/T56rt7oO79kcj9wQEUeK/FfSRE2zP
         aF2PhH+S+k2d9csesg+Qrgk87HYVu2B3PirDjbhp4nfYzAeEkcRL82nNG+LA/DhMNfBS
         nfhPshEa7zCoZv70uwQNiZrIcp6etEtJ8OHqawkd6u6TXEGYDGSp+qKsagmhLyIcdUCk
         zarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690812258; x=1691417058;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47Lx3g4qMMh4KzHi+DLVelaLZ/RwPmy1DZKuMy7J89Y=;
        b=XvTvYa4xX/rqfO8FjF/cw8QmBUWu+xDeiAwHEpJpbcdE+BYy5EyzQgZx+gCCCTokCZ
         +yf8V/uVFoewbdIiP+hd6jgOawE7YC52IP50Zt7zZDFXpT0Hj8GFVqCs538cMzoUSa4t
         /6uXPArb+8H5xlTl8qh5iAAAQYKUCKEan64LQbeu27rlamvs3WT5kwTIlWz0NY2oan/x
         jdgcpAzWx+B7aMJqxwxRbENDnMxqctAAmWRk2DFuC4aDLK/nNohC6Zhqkn4hg11g6A9N
         raddF65eIaJrkERfTqzwpQliZlccjYgLja3hCkhRwW4fExnYXImpjnscKCZQzVh3IFfM
         4ufA==
X-Gm-Message-State: ABy/qLbJFRx065VcKyRmXI9T5PEJ1Au+84FotZoanUBOmnKKE4biywBI
        pMmzXEcq90M1YyIf35lzA7OfxA==
X-Google-Smtp-Source: APBJJlFG3AKCOmrKkDXabmVgFzw7Rc89l44PsC9JHGHjVQh0V5CJfyA1qgtFEvc2+LAKqJ+U8yiRDg==
X-Received: by 2002:a05:600c:22da:b0:3fc:5a3:367c with SMTP id 26-20020a05600c22da00b003fc05a3367cmr31196wmg.32.1690812257907;
        Mon, 31 Jul 2023 07:04:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y7-20020adfdf07000000b00317ab75748bsm237588wrl.49.2023.07.31.07.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:04:17 -0700 (PDT)
Date:   Mon, 31 Jul 2023 11:36:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [bug report] [media] adv7511: add new video encoder
Message-ID: <591910e0-15db-4055-85ef-d4ca99649120@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans Verkuil,

The patch 5a544cce2177: "[media] adv7511: add new video encoder" from
Aug 23, 2013 (linux-next), leads to the following Smatch static
checker warning:

	drivers/media/i2c/adv7511-v4l2.c:929 adv7511_isr()
	warn: sleeping in IRQ context

drivers/media/i2c/adv7511-v4l2.c
    912 static int adv7511_isr(struct v4l2_subdev *sd, u32 status, bool *handled)

This is a new check so I'm not positive I understand everything
correctly yet.  This looks at functions which are passed to
request_irq() and assumes that they are not threaded.  Also the "_isr"
here stands for Interrupt Service Routine.

    913 {
    914         u8 irq_status;
    915         u8 cec_irq;
    916 
    917         /* disable interrupts to prevent a race condition */
    918         adv7511_set_isr(sd, false);
    919         irq_status = adv7511_rd(sd, 0x96);
    920         cec_irq = adv7511_rd(sd, 0x97);
    921         /* clear detected interrupts */
    922         adv7511_wr(sd, 0x96, irq_status);
    923         adv7511_wr(sd, 0x97, cec_irq);
    924 
    925         v4l2_dbg(1, debug, sd, "%s: irq 0x%x, cec-irq 0x%x\n", __func__,
    926                  irq_status, cec_irq);
    927 
    928         if (irq_status & (MASK_ADV7511_HPD_INT | MASK_ADV7511_MSEN_INT))
--> 929                 adv7511_check_monitor_present_status(sd);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
v4l2_ctrl_s_ctrl() takes a mutex so this is a sleeping function.

    930         if (irq_status & MASK_ADV7511_EDID_RDY_INT)
    931                 adv7511_check_edid_status(sd);
    932 
    933 #if IS_ENABLED(CONFIG_VIDEO_ADV7511_CEC)
    934         if (cec_irq & 0x38)
    935                 adv_cec_tx_raw_status(sd, cec_irq);
    936 
    937         if (cec_irq & 1) {
    938                 struct adv7511_state *state = get_adv7511_state(sd);
    939                 struct cec_msg msg;
    940 
    941                 msg.len = adv7511_cec_read(sd, 0x25) & 0x1f;
 
regards,
dan carpenter
