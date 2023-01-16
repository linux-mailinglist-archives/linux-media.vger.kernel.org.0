Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0B366BAFB
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 10:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjAPJzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 04:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjAPJyf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 04:54:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A57B193D3
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 01:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673862825;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=iWvJV8DkbbdPgvPCR8O8KsgDJrdv28E+eI+nejsGDFs=;
        b=D7P4y96bzpGwZ6V2cxeJ1hf9OtMDl6HaTvzzGfe+qC7nJIblFuqpjOsl0QRutDYfZk6yYt
        YCczMFzjgL8nIr3PROANWWUKFp046QjJ0J3QduDcj7HQVVjfhuX6/694otkH4N4MjcZAb/
        JEJyQaNEJaSe25fRel3RdF1S5XMYH6g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-fRT8iSQjO3eL9ET6AEd_QA-1; Mon, 16 Jan 2023 04:53:43 -0500
X-MC-Unique: fRT8iSQjO3eL9ET6AEd_QA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A06C0802BF3;
        Mon, 16 Jan 2023 09:53:43 +0000 (UTC)
Received: from calimero.vinschen.de (unknown [10.39.192.5])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6047D492B10;
        Mon, 16 Jan 2023 09:53:43 +0000 (UTC)
Received: by calimero.vinschen.de (Postfix, from userid 500)
        id D3695A8088F; Mon, 16 Jan 2023 10:53:41 +0100 (CET)
Date:   Mon, 16 Jan 2023 10:53:41 +0100
From:   Corinna Vinschen <vinschen@redhat.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCHv2 00/16] staging/media: remove most deprecated drivers
Message-ID: <Y8UepVxVuihu4Vjj@calimero.vinschen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230111112418.687882-1-hverkuil-cisco@xs4all.nl>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I only learned about this yesterday, so I hope I'm not too late.

Please don't do that.  You're about to remove working drivers used by a
lot of people.

If you remove them from the Linux kernel, you will leave *lots* of DVB-C
and DVB-S card users behind.  They will update their TV recording
machines to a newer system at one point and suddenly their ability to
record from TV is gone forever.

I'm personally affected by this as well.  We're using a machine with
four Technotrend S2-3200 Budget DVB-S2 cards for TV recordings using
the VDR package.  This card is apparently handled by the code under
drivers/staging/media/deprecated/saa7146.

If this code goes away, we will have to keep the machine running on
an old kernel for a long time.

I'm fortunate that I even learned about this developement, being a
developer myself, but how's a normal user to know that a Linux driver
they are using every day is about to be removed from the kernel?  Again,
please don't break the equipment of us users of these DVB-C and DVB-S
cards for the future.  


Thanks for listening,
Corinna

