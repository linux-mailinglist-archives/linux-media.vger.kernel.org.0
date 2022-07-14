Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3C7575191
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 17:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbiGNPSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 11:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbiGNPSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 11:18:54 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E85C16585
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 08:18:53 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id w12so2810417edd.13
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=gMcljGA6RiIJUly46ZYJ3RBh9KuEdw+92MnNFHCOp10=;
        b=R72Bc8MY0G1R3mxYmkpyVQKx64mh2Rgtxe1UcjXrt0u2MDwepMuMktPPW7bkAFjvVC
         A38GWgzUi0AEddsnUnGceeFoVfbl5eusnHGrdiPY7d7EbeWDVdpBvIhw8Q+C19P3LtK7
         v21dE/mH8Hpymm0BI1o2ZFeX8LhLxqnv+dULY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=gMcljGA6RiIJUly46ZYJ3RBh9KuEdw+92MnNFHCOp10=;
        b=1j6rXZUsqpDFrz3csfJ8RR2QzMIXTFE8QuFGjwxY1CzUgyGIvIHQYC3nLLYuLnp+O/
         B3GN+6zNCu0vzhb+Wzi2LhjLkdbLRN+kwwvg7vu6BImm8KRrtkJkEN8QERnaD8UUaHQw
         CwqUAtL24KLHJnkYm8Nib+DbAj+cVH7Xuiz0CuKTiv2gOeaG20d6bPPM0t6aazzlX0Tb
         GRc17roHqMYyZ2I6FBp/z2yx4YDN3riRksaByubpiMf7acXBVuFDWNOI4LAwaaJkOFDA
         dfw+qde3T06Rujd6p2VPVQPV3ikH5mlYiR0z952hqwRuxQFInKeDrll20RAmWfJzpbe0
         QmGg==
X-Gm-Message-State: AJIora++lEyyOo7/ZyLXVQB5mcSYozZQpBaeXmpbiR2bJXEJh5nfU50E
        XXYiJw+w/jXqx+ubJqX14Qvor36GXE+eCA==
X-Google-Smtp-Source: AGRyM1sh3Sque0W088iyV0FQe0d5u5edxXI9r1lEsd+ssZc5NznBI8wNuC3tIvh7B55YJXYeYYenyg==
X-Received: by 2002:a05:6402:3551:b0:43a:a5c0:2fbc with SMTP id f17-20020a056402355100b0043aa5c02fbcmr12686523edd.288.1657811931881;
        Thu, 14 Jul 2022 08:18:51 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id bq1-20020a056402214100b0043a422801f8sm1194659edb.87.2022.07.14.08.18.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 08:18:51 -0700 (PDT)
Date:   Thu, 14 Jul 2022 18:22:09 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Subject: properly set test pattern to a sub-device
Message-ID: <YtA0oTgCRlRP8K53@p310.k.g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	Hi guys,

I've got a long pipeline of four entities and need to make the imx492 sensor 
stream out a test pattern.  When i do:

	v4l2-ctl -d /dev/v4l-subdev2 --set-ctrl=test_pattern=2

I can see the driver acknowledging the switch to test pattern 2.  However, when 
start streaming with:

	v4l2-ctl -d /dev/video0 --stream-mmap --stream-to=frame.raw --stream-count=1

the driver reports setting the test pattern to the default 0.  How should this 
be done properly?


thanks,
Petko
