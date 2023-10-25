Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 491EA7D6578
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 10:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbjJYInW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 04:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbjJYInV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 04:43:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972FF9C;
        Wed, 25 Oct 2023 01:43:19 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E48C433C7;
        Wed, 25 Oct 2023 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698223399;
        bh=0zZhtkrYhPXwaPPhoU0Ao0T3LN1o1SJTsWAiRLH+OtY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bGX6ec8k8faIE72JDouiLWwMaguSXqR0yLi1tItQC4S4F4CekXA1hPt7C79hE9a6F
         PGbTOEGvkD3efKyOw4DroIi4UMl/D9PEFyWGgtPJTTOJt9Ujb4qL+pge+uAWvmmPCf
         4PCNB3Vsc3OHFCdRiLc9t0gQna0xczLbN1LNdnJfoSQr/ALqiL7ClNmCn2ykSZWH8H
         t3XVEym8yUOz7lmr6NLHYX7BbG3OEoojzIWBUpek3DyCFamqBDn1cGJaD1g7G+YEMU
         zi5ETf/Na9fv6+UWt25ZuKxKwUJEHrmnAC9+rhXe2er4nGF6SFErv1TVlLYvN1pay5
         sCbXdZYdLp7Bw==
Date:   Wed, 25 Oct 2023 10:43:16 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Marco Pagani <marpagan@redhat.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC PATCH] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <bychwi46hiqd34ch2f2ikvcijnq3hxvqudycsja5mawng46gyx@cq7wwxozv4si>
References: <20231023164541.92913-1-marpagan@redhat.com>
 <zakappnhljtx3axi2ovvis3evhju4cwqrena7j6gqn5kjdjtsb@mgrhkn5oboid>
 <789aaf2b-4d68-4128-b8ff-c1ba4849e141@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tcuh3gisjtvmugdz"
Content-Disposition: inline
In-Reply-To: <789aaf2b-4d68-4128-b8ff-c1ba4849e141@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--tcuh3gisjtvmugdz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 24, 2023 at 07:14:25PM +0200, Marco Pagani wrote:
> >> +static void drm_gem_shmem_test_obj_create_private(struct kunit *test)
> >> +{
> >> +	struct fake_dev *fdev =3D test->priv;
> >> +	struct drm_gem_shmem_object *shmem;
> >> +	struct drm_gem_object *gem_obj;
> >> +	struct dma_buf buf_mock;
> >> +	struct dma_buf_attachment attach_mock;
> >> +	struct sg_table *sgt;
> >> +	char *buf;
> >> +	int ret;
> >> +
> >> +	/* Create a mock scatter/gather table */
> >> +	buf =3D kunit_kzalloc(test, TEST_SIZE, GFP_KERNEL);
> >> +	KUNIT_ASSERT_NOT_NULL(test, buf);
> >> +
> >> +	sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> >> +	KUNIT_ASSERT_NOT_NULL(test, sgt);
> >> +
> >> +	ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> >> +	KUNIT_ASSERT_EQ(test, ret, 0);
> >> +	sg_init_one(sgt->sgl, buf, TEST_SIZE);
> >> +
> >> +	/* Init a mock DMA-BUF */
> >> +	buf_mock.size =3D TEST_SIZE;
> >> +	attach_mock.dmabuf =3D &buf_mock;
> >> +
> >> +	gem_obj =3D drm_gem_shmem_prime_import_sg_table(&fdev->drm_dev, &att=
ach_mock, sgt);
> >> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
> >> +	KUNIT_ASSERT_EQ(test, gem_obj->size, TEST_SIZE);
> >> +	KUNIT_ASSERT_NULL(test, gem_obj->filp);
> >> +	KUNIT_ASSERT_NOT_NULL(test, gem_obj->funcs);
> >> +
> >> +	shmem =3D to_drm_gem_shmem_obj(gem_obj);
> >> +	KUNIT_ASSERT_PTR_EQ(test, shmem->sgt, sgt);
> >> +
> >> +	/* The scatter/gather table is freed by drm_gem_shmem_free */
> >> +	drm_gem_shmem_free(shmem);
> >> +}
> >=20
> > KUNIT_ASSERT_* will stop the execution of the test on failure, you
> > should probably use a bit more of KUNIT_EXPECT_* calls otherwise you'll
> > leak resources.
> >=20
> > You also probably want to use a kunit_action to clean up and avoid that
> > whole discussion
> >
>=20
> You are right. I slightly prefer using KUnit expectations (unless actions
> are strictly necessary) since I feel using actions makes test cases a bit
> less straightforward to understand. Is this okay for you?

I disagree. Actions make it easier to reason about, even when comparing
assertion vs expectation

Like, for the call to sg_alloc_table and
drm_gem_shmem_prime_import_sg_table(), the reasonable use of assert vs
expect would be something like:

sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
KUNIT_ASSERT_NOT_NULL(test, sgt);

ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
KUNIT_ASSERT_EQ(test, ret, 0);

/*
 * Here, it's already not super clear whether you want to expect vs
 * assert. expect will make you handle the failure case later, assert will
 * force you to call kfree on sgt. Both kind of suck in their own ways.
 */

sg_init_one(sgt->sgl, buf, TEST_SIZE);

gem_obj =3D drm_gem_shmem_prime_import_sg_table(&fdev->drm_dev, &attach_moc=
k, sgt);
KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);

/*
 * If the assert fails, we forgot to call sg_free_table(sgt) and kfree(sgt).
 */

KUNIT_EXPECT_EQ(test, gem_obj->size, TEST_SIZE);
KUNIT_EXPECT_NULL(test, gem_obj->filp);
KUNIT_EXPECT_NOT_NULL(test, gem_obj->funcs);

/*
 * And here we have to handle the case where the expectation was wrong,
 * but the test still continued.
 */

But if you're not using an action, you still have to call kfree(sgt),
which means that you might still

shmem =3D to_drm_gem_shmem_obj(gem_obj);
KUNIT_ASSERT_PTR_EQ(test, shmem->sgt, sgt);

/*
 * If the assertion fails, we now have to call drm_gem_shmem_free(shmem)
 */

/* The scatter/gather table is freed by drm_gem_shmem_free */
drm_gem_shmem_free(shmem);

/* everything's fine now */

The semantics around drm_gem_shmem_free make it a bit convoluted, but
doing it using goto/labels, plus handling the assertions and error
reporting would be difficult.

Using actions, we have:

sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
KUNIT_ASSERT_NOT_NULL(test, sgt);

ret =3D kunit_add_action_or_reset(test, kfree_wrapper, sgt);
KUNIT_ASSERT_EQ(test, ret, 0);

ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
KUNIT_ASSERT_EQ(test, ret, 0);

ret =3D kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
KUNIT_ASSERT_EQ(test, ret, 0);

sg_init_one(sgt->sgl, buf, TEST_SIZE);

gem_obj =3D drm_gem_shmem_prime_import_sg_table(&fdev->drm_dev, &attach_moc=
k, sgt);
KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
KUNIT_EXPECT_EQ(test, gem_obj->size, TEST_SIZE);
KUNIT_EXPECT_NULL(test, gem_obj->filp);
KUNIT_EXPECT_NOT_NULL(test, gem_obj->funcs);

/* drm_gem_shmem_free will free the struct sg_table itself */
kunit_remove_action(test, sg_free_table_wrapper, sgt);
kunit_remove_action(test, kfree_wrapper, sgt);

shmem =3D to_drm_gem_shmem_obj(gem_obj);
KUNIT_ASSERT_PTR_EQ(test, shmem->sgt, sgt);

ret =3D kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
KUNIT_ASSERT_EQ(test, ret, 0);

The last one is arguable, but for the previous ones it makes error
handling much more convenient and easy to reason about.

The wrappers are also a bit inconvenient to use, but it's mostly there
to avoid a compiler warning at the moment.

This patch will help hopefully:
https://lore.kernel.org/linux-kselftest/20230915050125.3609689-1-davidgow@g=
oogle.com/

Maxime

--tcuh3gisjtvmugdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTjVJAAKCRDj7w1vZxhR
xYdGAQDkxKhWaor5tcnx6YjSfUKy3qxOyvKwHBkTrnr3ZiZJhgD/ciezUk1mtw77
8KroW1oLeeULoY/vcRzY1uB96jxR5Ac=
=fbyv
-----END PGP SIGNATURE-----

--tcuh3gisjtvmugdz--
