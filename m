Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24AAA5A3DDB
	for <lists+linux-media@lfdr.de>; Sun, 28 Aug 2022 15:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiH1Nrx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 09:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiH1Nrv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 09:47:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91AEE2D1C9
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661694469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=/Q7dS4/8NIr0wOghMMycjlsm1YTWgXk7FNOCXK/FLy0=;
        b=gvLuubz3XBetUDpdsU3WS1EegM3p0KrL84goGbBvehh2f6dOyf/ccbmvxZ1z7zeWHcqPg8
        CnR+TpCddi70PHuaYJPyJWfMsq9HrFky+ninutb3t9M73rFV0KAOF3qf6dPu/+puCC3mD4
        rinxyZFVSVZjDxmAjhGdiPw941S2CnY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-gHDnut6kMrmz_mwifgWJiA-1; Sun, 28 Aug 2022 09:47:47 -0400
X-MC-Unique: gHDnut6kMrmz_mwifgWJiA-1
Received: by mail-ed1-f72.google.com with SMTP id z20-20020a05640235d400b0043e1e74a495so4081621edc.11
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 06:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=/Q7dS4/8NIr0wOghMMycjlsm1YTWgXk7FNOCXK/FLy0=;
        b=CuGRdpURWuanMR0eIRuB/MNKT1LYIvvVhhS3O/88NGYjU+6xWtfSdEe6L0+FQQESI2
         t1WCKHFAaMBw43R9okPYQ7I9YS3hk1l1lCG/tMLGkHf7a/q1D9DaRUt7rm3YEWmrEULZ
         wR1vNVLqlt3JTxnHbevhlz9wNJisrpV7OFpRgo5G6WQJOd3e3n/a8sBkxfmL+j0245wL
         CeOn6dw9NjmEgECQEtSKUWsd8bKPOr21lBIHJvM0ZsboXLZUyDbn8rbRGDkijmxiTmP8
         RgKBx4YJdr2UgOc1dPWRAODi1KW5Hw6HHUPbLBXuWOSWAxKhClAn3KB3PYS6/8iHaR2v
         4KAw==
X-Gm-Message-State: ACgBeo1vDkpeFTh7+dBPHDv7+cB0Sc6ckXXWnVsnCHhsYPXs5Y5FqKv7
        16rWuPvIPmjRO7lpurkFIm2hlsy/QTND0JXB/UqpwBb7rPcNHioVpvHWzRwW5HwEBaAbLl6d5th
        MBxMMAT8ZzvpQHBLOPbrJ8alVX+MpbKlB+fYRljlxEXXlz1G57kzKsDr5Re/AL5hxdBbq2nZ701
        U=
X-Received: by 2002:a17:906:4795:b0:73d:daa0:3cbf with SMTP id cw21-20020a170906479500b0073ddaa03cbfmr8836921ejc.693.1661694466579;
        Sun, 28 Aug 2022 06:47:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7kta9YCrtSpPKDzbonOaL6UwFsvmA75U8wGXPb25Lz8xYsBL9hk6IzJ6VLlecUEEehG9bY1A==
X-Received: by 2002:a17:906:4795:b0:73d:daa0:3cbf with SMTP id cw21-20020a170906479500b0073ddaa03cbfmr8836914ejc.693.1661694466358;
        Sun, 28 Aug 2022 06:47:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906198600b0073dc6def190sm3244571ejd.158.2022.08.28.06.47.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 06:47:45 -0700 (PDT)
Message-ID: <a76bb56f-b99f-c1f7-764b-be8e5a71b152@redhat.com>
Date:   Sun, 28 Aug 2022 15:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: struct vb2_buffer and struct vb2_v4l2_buffer both have a "struct
 vb2_plane planes[max]" member ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

While working on converting the atomisp code to videobuf2 I noticed
that "struct vb2_buffer" has a:
	
	struct vb2_plane        planes[VB2_MAX_PLANES];

member and "struct vb2_v4l2_buffer" extends "struct vb2_plane",
yet it also contains a (duplicate?) "struct vb2_plane" array:

struct vb2_v4l2_buffer {
	struct vb2_buffer       vb2_buf;
	...
	struct vb2_plane        planes[VB2_MAX_PLANES];
};

Since both are the exact same type having 2 of them seems
weird.

Is there any reasons why we cannot replace all uses of
vb2_v4l2_buffer.planes with vb2_v4l2_buffer.vb2_buf.planes
and then drop vb2_v4l2_buffer.planes?

Regards,

Hans

