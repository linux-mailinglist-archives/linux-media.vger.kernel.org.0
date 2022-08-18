Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E283A5987A0
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 17:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245635AbiHRPkQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 11:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245055AbiHRPkP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 11:40:15 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4C9B6D19
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 08:40:14 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id tl27so3981878ejc.1
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 08:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=5yfHuIhj9QvtnZqJGWuNbxZVI77mZCS6L6bnYJzt/Fo=;
        b=eO0S6nQt/A/plsVtaEHP1+xB9dxoBF1v0wL0iQcwnQHg3A5K76+cIbi6h3unkhAkl1
         8sRzmy/o7ymneaGboW7wF/0sIlakzIyVmBVef/w70kZe3zBlqvjBScoa9+KqqAgskXtf
         EDhaDgJWkw73zq1ZF86yg2L52Nz2qEsc2Hqf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=5yfHuIhj9QvtnZqJGWuNbxZVI77mZCS6L6bnYJzt/Fo=;
        b=ozP8o+wF/glATESk2H9LyNGH2ciqZ+g/0YY9dc6ZavHp/nvU7rBLzz6c9W3E3ZqKMa
         bucPr62zwyRFKGaOiyqemfWB0gibTaLjS2DBLzjHSJt/c6P7crS3fuL/2B7WXugxCbj6
         mj8SLKYzxM5CDtkIGzAwTtZCVJacdA+YSd8zL2PQ0OrQkUbcD800q/pkEydpwjq/EcX4
         vRiHP/by7UT94hwigVbHBnItYC9lrXFkvDEvsjCb+c9+XfmmspGI2xn3JYLgHkwRB42u
         183AxsOm4zDQF2UnxIKxE48jts+GRVLONnHlN8J6Ity9Eh4ZLYFOQpYSg4B8FjKXH7+Q
         giig==
X-Gm-Message-State: ACgBeo15rFUs5RuMMGJp/q7cu5SkYzZxC/R1ZO5d/AB1mLVXe8N2UaXK
        LXhSfv5fKjvX41vTk1wVn8xpCQ==
X-Google-Smtp-Source: AA6agR4WY/0bYo6bACg4l0rR7jBVWlq7dRSTWPQhyjRB1nsxTvtx4RfJRd0py8YZVlqWr8ReOw76bQ==
X-Received: by 2002:a17:906:9755:b0:739:b084:dca9 with SMTP id o21-20020a170906975500b00739b084dca9mr2210922ejy.616.1660837213077;
        Thu, 18 Aug 2022 08:40:13 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id md3-20020a170906ae8300b0072b13ac9ca3sm988554ejb.183.2022.08.18.08.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 08:40:12 -0700 (PDT)
Date:   Thu, 18 Aug 2022 18:44:19 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: Re: imx8m-mini csi-2 limitations
Message-ID: <Yv5eU57/Yxy8JqLZ@p310.k.g>
References: <YvpPusE1rOzmgPYN@carbon.k.g>
 <Yv4GEUTj4rMiagAX@p310.k.g>
 <20220818105131.gurtn74av2ilr7bi@uno.localdomain>
 <6573133.31r3eYUQgx@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6573133.31r3eYUQgx@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-08-18 14:41:18, Alexander Stein wrote:
> Hi Petko,

Hi Alexander,

<snip>

> While it does not exactly answer your question, the i.MX8M Mini Datasheet 
> (both for Commercial and Industrial) mentions "four-lane MIPI camera serial 
> interfaces, which operates up to a maximum bit rate of 1.5 Gbps". I would 
> assume the bridge is capable of handling the full link speed on four lanes, 
> otherwise this would be quite useless.

Ahem, if that the case (useless), it won't be a first.

In theory the d-phy should support 2.5gbps, but in practice it is only 1.5gbps.  
If CSIS to CSI (bridge) can't be made to transfer 16bit words for 12 bit raw 
format and if the frequency between both can go up to 500mhz, this leaves us 
with 4gbps (8bit x 500mhz) max bandwidth.

If the above calculation is correct, this leaves us with only one option - limit 
the speed of the camera sensor.


cheers,
Petko
