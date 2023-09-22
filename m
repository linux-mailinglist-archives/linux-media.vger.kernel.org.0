Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25AE87AB8C7
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 20:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbjIVSAq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 14:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbjIVSAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 14:00:45 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD2799
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 11:00:39 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bff936e10fso48559111fa.1
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 11:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695405637; x=1696010437; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5QU58RSs7u/Md8yDeH4s0yv1YOZ6/qjN9a7LjvwLeiA=;
        b=HVYDo+AldGBud71xB2HRIaLi0kKGEy6QNi1z3r3kQRRSHRGgX/9km52jK6HAdnrL+l
         lvGVO7tkPd++2j7k54QLfSmdtKf00YX8a5nTZqym2h1omIobAjCYkigb6PYjMjl/RekJ
         OXEU96Yke7ElvH4gxHTEGvXZaIjPRXUADhEaqcNo0yMhIFWkmIpCQ4+VNZa3F6rkaANW
         OEGsLagKXchV1KmcorG//ZSYDM6eGRjxl30Qal2Fu/XNxnWTqGyh0Yq12iqH2nX3J/U9
         74tyZ9Pfvkrh0sofoIzdAtTu3iAOpXR6TYlGVMLprm4EVq9Oh3e7/oHvqAh3VKcb/Pn4
         sCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405637; x=1696010437;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QU58RSs7u/Md8yDeH4s0yv1YOZ6/qjN9a7LjvwLeiA=;
        b=E57cB73T2DbHmoGVqF0tGr2ECpaKSWWjoBK/NTGyfWumhNDeKq3MSWe7IYDq9KmAvy
         DwkB5GzAd5C3dxTZdMNev4OLr+tmXf+kSqmaDCTv8IBAyyxQOZ2qSkj6qz6clI5B9/V9
         wZ8dHgMsqCvZnkldjnwtjfjtNu2GGl7zxQTdcsPCmSGxzSog7B1OqiZOuIE2PtV1/Y4r
         zDDAfRnHjKIe+A7N1duRbrmi0HkM11MnqZKbnJcFW/LRF2UZmVBi/8pcYz9tRJOXTkC3
         VQkVRxQ7drBZYVmMEflMstgxaD9eUiJybNUpnlpEgo38qGkcLYdqjs8tD0Kx/8CI2bq9
         448w==
X-Gm-Message-State: AOJu0YwSXf9KDIixbLO8WfuZbJp0qKh5aRB5a82V7K+Pqmm6LhVZe4Fe
        PX4f8SfjaH5FbBO6HY9/Fmr993PrPr39OML6b4s=
X-Google-Smtp-Source: AGHT+IHsCPs3gchxCVHSWlq0cb2fZfHhUkVRIcr7+zAO9PJfNJDbimNebTDqh9dyKHIsgEhOExxTdhuNax2aAPO/ypY=
X-Received: by 2002:a05:651c:ba8:b0:2c0:1f54:f4a2 with SMTP id
 bg40-20020a05651c0ba800b002c01f54f4a2mr1343332ljb.8.1695405637113; Fri, 22
 Sep 2023 11:00:37 -0700 (PDT)
MIME-Version: 1.0
From:   David willey <fisrtleadsprovider@gmail.com>
Date:   Fri, 22 Sep 2023 23:30:22 +0530
Message-ID: <CAF09QbphHcMJO3tPqq7o2cX4bc4OoAWqVO6XVG3g_j-LR0f-iw@mail.gmail.com>
Subject: RE: NAB Show Attendees Data-List 2023
To:     David willey <fisrtleadsprovider@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Would you be interested in acquiring The National Association of
Broadcasters Attendees Email List 2023?

Number of Contacts: - 45,769
Cost: $ 1,938

Interested? Email me back; I would love to provide more information on the list.

Kind Regards,
David willey
Marketing Coordinator
