Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB4091548E0
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 17:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgBFQNx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 11:13:53 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58807 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727305AbgBFQNw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Feb 2020 11:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581005631;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PqsiX+3faasAmY8XavRfzT6A/YLWx6plCJX7GW5l8Hk=;
        b=aB74DyVs/Uv4d+Dl4oVYPxJBR4Hm36rv/B5RdkqO9spFmIMEivpdMVwCeFAMkqGf7Rv6a6
        bmKy9rP8QCkGGloj6lYSNroE/Tjx8CqlSXocgIY6AmFRu33P+m1wEgPDldmDK42a+CWa2Y
        QhgVhZPApK/V7Ae6H8bDAHfofddIxuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-vYYP-_LVO3-FLvHUAPJu1A-1; Thu, 06 Feb 2020 11:13:49 -0500
X-MC-Unique: vYYP-_LVO3-FLvHUAPJu1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 257C3802597;
        Thu,  6 Feb 2020 16:13:48 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DACF590067;
        Thu,  6 Feb 2020 16:13:45 +0000 (UTC)
Date:   Thu, 6 Feb 2020 17:13:43 +0100
From:   Cornelia Huck <cohuck@redhat.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 27/27] docs: kvm: review-checklist.txt: rename to
 ReST
Message-ID: <20200206171343.40e4a1ca.cohuck@redhat.com>
In-Reply-To: <8efe2cb409b6aaea2f01f4167db3c13e816129c5.1581000481.git.mchehab+huawei@kernel.org>
References: <cover.1581000481.git.mchehab+huawei@kernel.org>
        <8efe2cb409b6aaea2f01f4167db3c13e816129c5.1581000481.git.mchehab+huawei@kernel.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu,  6 Feb 2020 15:50:24 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This file is already in ReST compatible format.
> So, rename it and add to the kvm's index.rst.
> 
> While here, use the standard conversion for document titles.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/virt/kvm/index.rst                               | 2 ++
>  .../virt/kvm/{review-checklist.txt => review-checklist.rst}    | 3 +++
>  2 files changed, 5 insertions(+)
>  rename Documentation/virt/kvm/{review-checklist.txt => review-checklist.rst} (95%)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

